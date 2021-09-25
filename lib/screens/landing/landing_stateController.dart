import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pricelocq_temp/screens/login/login_statecontroller.dart';

final landingProvider = StateNotifierProvider<LandingProvider, Status>(
    (ref) => LandingProvider(ref));

class LandingProvider extends StateNotifier<Status> {
  LandingProvider(this.ref) : super(Status.none);
  final ProviderRefBase ref;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> initLocation() async {
    print("Called");
    bool serviceEnabled;
    LocationPermission permission;

    state = Status.loading;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _errorMessage = 'Location services are disabled.';
      state = Status.error;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _errorMessage = 'Location permissions are denied';
        state = Status.error;
      } else {
        // Position position = await Geolocator.getCurrentPosition(
        //     desiredAccuracy: LocationAccuracy.high);
        state = Status.done;
        // print(
        //     "/////////////////////////////////////////////////////// $position");
      }
    }
  }
}

final testProvider = FutureProvider<Position>((ref) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // _errorMessage = 'Location permissions are denied';
      }
    }
  }

  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
});
