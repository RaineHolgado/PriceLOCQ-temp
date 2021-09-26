import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_temp/screens/login/login_statecontroller.dart';

final landingProvider = StateNotifierProvider<LandingProvider, Status>(
    (ref) => LandingProvider(ref));

class LandingProvider extends StateNotifier<Status> {
  LandingProvider(this.ref) : super(Status.none);
  final ProviderRefBase ref;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  late CameraPosition _currentLocation;
  CameraPosition get currentLocation => _currentLocation;

  Future<void> initLocation() async {
    try {
      state = Status.loading;
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw 'Location services are disabled.';

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied)
          throw 'Location permissions are denied';
      }
      Position _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      LatLng latLngPosition = LatLng(_position.latitude, _position.longitude);
      _currentLocation = CameraPosition(target: latLngPosition, zoom: 14.4746);

      state = Status.done;
    } catch (e) {
      _errorMessage = '$e';
      state = Status.error;
    }
  }
}
