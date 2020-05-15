/// A position on the surface of the earth
class Position {
  const Position(this.latitude, this.longitude);

  const Position.baltimore()
      : latitude = 39.2904,
        longitude = -76.6122;

  const Position.bangor()
      : latitude = 44.8,
        longitude = -68.77;

  final double latitude;
  final double longitude;
}
