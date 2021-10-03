part of 'location_bloc.dart';

class LocationState {
  const LocationState(
      {this.id, this.status, this.location, this.currentLocation, this.routes});

  final String? id;
  final PermissionStatus? status;
  final LatLng? location;
  final LatLng? currentLocation;
  final List<LatLng>? routes;

  LocationState copyWith(
      {String? id,
      PermissionStatus? status,
      LatLng? location,
      LatLng? currentLocation,
      List<LatLng>? routes}) {
    return LocationState(
        id: id ?? this.id,
        status: status ?? this.status,
        location: location ?? this.location,
        currentLocation: currentLocation ?? this.currentLocation,
        routes: routes ?? this.routes);
  }
}
