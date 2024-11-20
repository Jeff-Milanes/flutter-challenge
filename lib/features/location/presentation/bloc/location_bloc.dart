import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:coding_challenge/features/location/domain/repositories/location_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

part 'location_event.dart';
part 'location_state.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(this._location, this._locationRepository)
      : super(const LocationState()) {
    on<Permission>(_permission);
    on<LocationChanged>(_onLocationChanged);
    on<CurrentLocation>(_onCurrentLocationChanged);

    _location.onLocationChanged.listen(
      (location) => add(
        CurrentLocation(
          LatLng(location.latitude!, location.longitude!),
        ),
      ),
    );
  }

  final Location _location;
  final LocationRepository _locationRepository;

  Future<void> _permission(
      Permission event, Emitter<LocationState> emit) async {
    late PermissionStatus permissionStatus;

    permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.deniedForever) {
      permissionStatus = await _location.requestPermission();
    }

    emit(state.copyWith(status: permissionStatus));
  }

  Future<void> _onLocationChanged(
      LocationChanged event, Emitter<LocationState> emit) async {
    final randomLocation = _getRandomLocation(location: event.location);
    final routes = await _locationRepository.getRoutes(
        currentLat: state.currentLocation!.latitude,
        currentLng: state.currentLocation!.longitude,
        destinationLat: randomLocation.latitude,
        destinationLng: randomLocation.longitude);

    emit(
      state.copyWith(location: randomLocation, routes: routes),
    );
  }

  void _onCurrentLocationChanged(
      CurrentLocation event, Emitter<LocationState> emit) {
    emit(state.copyWith(currentLocation: event.currentLocation));
  }

  // using android implementation as a reference https://stackoverflow.com/questions/33976732/generate-random-latlng-given-device-location-and-radius/35843019
  static LatLng _getRandomLocation(
      {required LatLng location, int radius = 1000}) {
    double x0 = location.latitude;
    double y0 = location.longitude;

    Random random = Random();

    // Convert radius from meters to degrees
    double radiusInDegrees = radius / 111000;

    double u = random.nextDouble();
    double v = random.nextDouble();
    double w = radiusInDegrees * sqrt(u);
    double t = 2 * pi * v;
    double x = w * cos(t);
    double y = w * sin(t) * 1.75;

    // Adjust the x-coordinate for the shrinking of the east-west distances
    double newX = x / cos(y0);

    double foundLatitude = newX + x0;
    double foundLongitude = y + y0;
    LatLng randomLatLng = LatLng(foundLatitude, foundLongitude);

    return randomLatLng;
  }
}
