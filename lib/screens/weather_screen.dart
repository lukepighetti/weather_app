import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:srl/extensions/adapters.dart';
import 'package:srl/extensions/color.dart';
import 'package:srl/extensions/num.dart';
import 'package:srl/extensions/open_weather_hourly_point.dart';
import 'package:srl/extensions/string.dart';
import 'package:srl/models/position.dart';
import 'package:srl/services/open_weather/endpoints/onecall.dart';
import 'package:srl/services/open_weather/models/all_weather_data.dart';
import 'package:srl/services/open_weather/open_weather.dart';
import 'package:srl/widgets/animated_icon.dart';
import 'package:srl/widgets/app_scaffold.dart';
import 'package:srl/widgets/dot_indicator.dart';
import 'package:srl/widgets/hourly_weather.dart';
import 'package:srl/widgets/settings_page.dart';
import 'package:srl/widgets/srl_icons.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Position>(
        stream: Geolocator().getPositionStream(),
        builder: (context, snapshot) {
          if (snapshot.data == null) return SizedBox.shrink();

          return WhenRebuilder<AllWeatherData>(
            observe: () => RM.stream(
              IN.get<OpenWeather>().getAllWeatherData(PositionModel(
                  snapshot.data.latitude, snapshot.data.longitude)),
            ),
            onIdle: () => Center(child: Text("We're waiting for the weather!")),
            onWaiting: () => Center(child: CircularProgressIndicator()),
            onError: (error) => Center(child: Text("$error")),
            onData: (allWeather) {
              final weatherCall = allWeather.oneCall;
              final locationName = allWeather.currentWeather.name;

              if (weatherCall == null) return SizedBox.shrink();

              return AppScaffold(
                currentIndex: _selectedIndex,
                pages: [
                  AppScaffoldPage(
                    background:
                        buildWeatherBackground(weatherCall, locationName),
                    foreground: HourlyWeather(oneCall: weatherCall),
                    foregroundHeight: 180,
                  ),
                  AppScaffoldPage(
                    background: Placeholder(color: Colors.red),
                    foreground: Placeholder(color: Colors.red),
                    foregroundHeight: 240,
                  ),
                  AppScaffoldPage(
                    background: Placeholder(color: Colors.blue),
                    foreground: Placeholder(color: Colors.blue),
                    foregroundHeight: 120,
                  ),
                  AppScaffoldPage(
                    background: Placeholder(color: Colors.green),
                    foreground: SettingsPage(),
                    foregroundHeight: MediaQuery.of(context).size.height,
                    borderRadius: Radius.zero,
                    foregroundPadding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                  ),
                ],
                bottomNavigationBarHeight: 80,
                bottomNavigationBar: buildBottomBar(),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildBottomBar() {
    return Padding(
      /// Bottom padding is handled by SafeArea.minimum
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: SalomonBottomBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() => _selectedIndex = index);
          },
          margin: EdgeInsets.all(10),
          itemPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).primaryColor,
          items: [
            SBBItem(
              icon: Icon(SRLIcons.forecast_alt),
              title: Text('Forecast'.toUpperCase()),
            ),
            SBBItem(
              icon: Icon(SRLIcons.radar),
              title: Text('Radar'.toUpperCase()),
            ),
            SBBItem(
              icon: Icon(SRLIcons.locations),
              title: Text('Locations'.toUpperCase()),
            ),
            SBBItem(
              icon: Icon(SRLIcons.settings),
              title: Text('Settings'.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWeatherBackground(
      OpenWeatherOneCall weatherCall, String locationName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// Header
        Column(
          children: [
            /// Location name, ie `New York`
            Text(
              "$locationName".toUpperCase(),
              style: TextStyle(
                fontSize: 28,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),

            /// Weather description, ie `Scattered Snow`
            Text(
              '${weatherCall.current.weather.description.toCapitalized()}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryColor.opacity200,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
                fontFamily: "", // Use default system font
              ),
            ),
            SizedBox(height: 12),

            /// Page indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  SRLIcons.locations_filled,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                ),
                for (var _ in [1, 2])
                  DotIndicator(
                    color: Theme.of(context).primaryColor.opacity200,
                  ),
              ],
            ),
          ],
        ),

        /// Weather icon
        SRLAnimatedIcon(
          type: weatherCall.current.weather.icon.asAnimatedIcon,
          dimension: 180,
        ),

        /// Temperature & wind speed
        Column(
          children: [
            /// Temperature, ie `14°`
            Stack(
              overflow: Overflow.visible,
              children: [
                Text(
                  '${weatherCall.current.temp.asFahrenheit.round()}',
                  style: TextStyle(
                    fontSize: 84,
                    fontWeight: FontWeight.normal,
                    height: 1.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),

                /// Degree symbol, artisinally positioned
                Positioned(
                  right: -30,
                  child: Text(
                    '°',
                    style: TextStyle(
                      fontSize: 84,
                      height: 1.0,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),

            /// Max/min temp, ie `24/8`
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Theme.of(context).primaryColor.opacity50,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 12,
              ),
              child: Text(
                "${weatherCall.hourly.maxTemp.asFahrenheit.round()}/${weatherCall.hourly.minTemp.asFahrenheit.round()}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Theme.of(context).primaryColor.opacity200,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
