import 'package:coding_challenge/features/location/data/datasources/location_datasource.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class LocationRepository {
  Future<List<LatLng>> getRoutes(
      {double? currentLat,
      double? currentLng,
      double? destinationLat,
      double? destinationLng});
}

@LazySingleton(as: LocationRepository)
class ImpLocationRepository implements LocationRepository {
  ImpLocationRepository(this._locationDataSource);

  final LocationDataSource _locationDataSource;
  @override
  Future<List<LatLng>> getRoutes(
      {double? currentLat,
      double? currentLng,
      double? destinationLat,
      double? destinationLng}) async {
    return await _locationDataSource.directions(
        currentLat: currentLat,
        currentLng: currentLng,
        destinationLat: destinationLat,
        destinationLng: destinationLng);
  }
}
