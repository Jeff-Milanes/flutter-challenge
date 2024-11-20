import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class LocationDataSource {
  Future<List<LatLng>> directions(
      {double? currentLat,
      double? currentLng,
      double? destinationLat,
      double? destinationLng});
}

@LazySingleton(as: LocationDataSource)
class ImpLocationDataSource implements LocationDataSource {
  ImpLocationDataSource(this._dio);

  final Dio _dio;

  @override
  //TODO: Temporarily uses directions API from mapquestapi.com because my google account is having a problem.
  Future<List<LatLng>> directions(
      {double? currentLat,
      double? currentLng,
      double? destinationLat,
      double? destinationLng}) async {
    final baseUrl = dotenv.env['DIRECTIONS_PROVIDER_URL'];
    final response = await _dio.get(baseUrl!, queryParameters: {
      'key': dotenv.env['DIRECTIONS_API_KEY'],
      'from': '$currentLat,$currentLng',
      'to': '$destinationLat,$destinationLng'
    });

    return (response.data['route']['legs'][0]['maneuvers'] as List)
        .map((e) => LatLng(e['startPoint']['lat'], e['startPoint']['lng']))
        .toList();
  }
}
