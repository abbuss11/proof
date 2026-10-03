import '../models/land_model.dart';

class LandDemoData {
  LandDemoData._();

  static const List<LandModel> lands = [
    LandModel(
      id: 'LAND-001',
      title: 'Terrain résidentiel',
      latitude: 0.3901,
      longitude: 9.4544,
      status: LandStatus.available,
    ),
    LandModel(
      id: 'LAND-002',
      title: 'Terrain commercial',
      latitude: 0.3918,
      longitude: 9.4572,
      status: LandStatus.transfer,
    ),
    LandModel(
      id: 'LAND-003',
      title: 'Terrain familial',
      latitude: 0.3884,
      longitude: 9.4518,
      status: LandStatus.dispute,
    ),
  ];
}