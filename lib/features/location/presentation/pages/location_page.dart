import 'package:coding_challenge/core/enum/mark_type.dart';
import 'package:coding_challenge/core/injection/injection.dart';
import 'package:coding_challenge/features/location/presentation/bloc/location_bloc.dart';
import 'package:coding_challenge/features/location/presentation/widgets/marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
      create: (_) => locator<LocationBloc>(),
      child: const Location(),
    );
  }
}

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(14.5831, 120.9794), zoom: 15);

  GoogleMapController? _googleMapController;

  @override
  void initState() {
    context.read<LocationBloc>().add(const Permission());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LocationBloc, LocationState>(
        listener: (context, state) {
          if (state.status == PermissionStatus.denied ||
              state.status == PermissionStatus.deniedForever) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                    content: Text(
                        'Permission for location needs to update in the settings.')),
              );
          }
        },
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            return Stack(
              children: [
                SafeArea(
                  child: GoogleMap(
                    initialCameraPosition: _initialCameraPosition,
                    mapToolbarEnabled: false,
                    onMapCreated: (controller) =>
                        _animateCameraTo(controller: controller, state: state),
                    myLocationEnabled:
                        state.status == PermissionStatus.granted ||
                                state.status == PermissionStatus.grantedLimited
                            ? true
                            : false,
                    markers: {
                      if (state.currentLocation != null)
                        marker(
                            type: MarkType.currentLocation,
                            location: LatLng(state.currentLocation!.latitude,
                                state.currentLocation!.longitude),
                            currentLocation: true),
                      if (state.location != null)
                        marker(
                          type: MarkType.destination,
                          location: LatLng(state.location!.latitude,
                              state.location!.longitude),
                        )
                    },
                    circles: {
                      if (state.currentLocation != null)
                        Circle(
                          circleId: const CircleId('id'),
                          strokeWidth: 1,
                          center: LatLng(state.currentLocation!.latitude,
                              state.currentLocation!.longitude),
                          radius: 10000, // 10 kilometer
                        )
                    },
                    polylines: {
                      Polyline(
                          polylineId: const PolylineId('id'),
                          points: state.routes ?? [],
                          width: 2,
                          color: Colors.red)
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    label: const Text(
                      'Go to Random Location',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ), backgroundColor: Colors.blue,
                    ),
                    icon: const Icon(Icons.directions, color: Colors.white),
                    onPressed: () {
                      if (state.status == PermissionStatus.granted ||
                          state.status == PermissionStatus.grantedLimited) {
                        context.read<LocationBloc>().add(
                              LocationChanged(
                                (state.currentLocation!),
                              ),
                            );
                      } else {
                        context.read<LocationBloc>().add(
                              const Permission(),
                            );
                      }
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _animateCameraTo(
      {GoogleMapController? controller, required LocationState state}) {
    if (controller != null) {
      _googleMapController = controller;
    }

    if (state.currentLocation != null) {
      _googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(state.currentLocation!.latitude,
                  state.currentLocation!.longitude),
              zoom: 11.5),
        ),
      );
    }
  }
}
