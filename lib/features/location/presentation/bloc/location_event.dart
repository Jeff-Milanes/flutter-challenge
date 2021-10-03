part of 'location_bloc.dart';

abstract class LocationEvent {
  const LocationEvent();
}

class Permission extends LocationEvent {
  const Permission({this.status});

  final PermissionStatus? status;
}

class LocationChanged extends LocationEvent {
  const LocationChanged(this.location);

  final LatLng location;
}

class CurrentLocation extends LocationEvent {
  const CurrentLocation(this.currentLocation);

  final LatLng currentLocation;
}
