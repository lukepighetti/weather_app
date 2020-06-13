/// A position on the surface of the earth
class PositionModel {
  const PositionModel(this.latitude, this.longitude);

  const PositionModel.baltimore()
      : latitude = 39.2904,
        longitude = -76.6122;

  const PositionModel.bangor()
      : latitude = 44.8,
        longitude = -68.77;

  final double latitude;
  final double longitude;
}
