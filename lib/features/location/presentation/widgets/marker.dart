import 'package:coding_challenge/core/enum/mark_type.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Marker marker(
    {required MarkType type,
    required LatLng location,
    bool currentLocation = false}) {
  return Marker(
    markerId: MarkerId(EnumToString.convertToString(type, camelCase: true)),
    position: LatLng(location.latitude, location.longitude),
    icon: BitmapDescriptor.defaultMarkerWithHue(type == MarkType.currentLocation
        ? BitmapDescriptor.hueGreen
        : BitmapDescriptor.hueRed),
    infoWindow: InfoWindow(
      title: EnumToString.convertToString(type, camelCase: true),
    ),
  );
}
