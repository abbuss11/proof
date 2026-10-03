class LandModel {
  final String id;
  final String title;
  final double latitude;
  final double longitude;
  final LandStatus status;

  const LandModel({
    required this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.status,
  });
}

enum LandStatus {
  available,
  transfer,
  dispute,
}