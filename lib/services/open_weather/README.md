# OpenWeather Service

The OpenWeather service uses composition to build a monolithic service instead
of having a vaguely named repository, service, view controller, view model, etc.
Instead of struggling with the responsibility of multiple service-like classes,
we simply write "features" as mixins and then create a single service that binds
these features together. It's also easy to test subsections of your service.

You can imagine features like `fetching`, `persistence`, and `polling`, where
fetching makes network calls, persistence handles offline storage, and polling 
fires an event whenever we need to poll the network for fresh data.

The composition pattern is as such.

## FooFetching (first feature)

```dart
/// Every feature specifies it's own dependencies.
///
/// This feature has no dependencies.
abstract class FooFetchingDependencies {}

/// Each feature is a mixin on those dependencies.
///
/// This feature is fetching data from a server.
mixin FooFetching on FooFetchingDependencies {
  Future<Foo> fetchFoo() async {
    final response = await http.get("localhost:3000/foo");
    final json = jsonDecode(response.body);
    return Foo.fromJson(json);
  }
}
```

## FooPersistence (second feature)

```dart
/// This feature depends on [SharedPreferences]
abstract class FooPersistenceDependencies {
  SharedPreferences get sharedPreferences;
}

/// This feature stores and retrieves data from the device
mixin FooPersistence on FooPersistenceDependencies {
  /// Save [Foo] to local storage
  void persistFoo(Foo foo) {
    final json = foo.toJson();
    final string = jsonEncode(json);
    sharedPreferences.setString("Foo", string);
  }

  /// Get [Foo] from local storage
  Foo hydrateFoo() {
    final string = sharedPreferences.getString("Foo");
    final json = jsonDecode(string);
    return Foo.fromJson(json);
  }
}
```

## FooService (service)

```dart
/// The service mixes in all dependencies and features
class FooService
    with
        FooFetchingDependencies,
        FooFetching,
        FooPersistenceDependencies,
        FooPersistence {
  /// Mixing in the above dependencies enforces
  /// the needs of our features.
  ///
  /// [FooPersistenceDependencies] needs [SharedPreferences],
  /// so we add that field here.
  final SharedPreferences sharedPreferences;

  FooService(this.sharedPreferences);

  /// Methods on our service class stitch together our features
  /// into a rich and opinionated API.
  Stream<Foo> latestFoo() async* {
    Foo foo;

    /// Fetch & yield from storage
    foo = hydrateFoo();
    if (foo != null) yield foo;

    /// Fetch & yield from network
    foo = await fetchFoo();
    persistFoo(foo);

    yield foo;
  }
}
```
