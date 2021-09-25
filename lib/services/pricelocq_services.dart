import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_temp/model/credential.dart';
import 'package:pricelocq_temp/model/station.dart';
import 'package:pricelocq_temp/repository/pricelocq_repo.dart';

final priceLocqServiceProvider =
    Provider<PriceLocqServiceProvider>((ref) => PriceLocqServiceProvider(ref));

class PriceLocqServiceProvider {
  PriceLocqServiceProvider(this.ref);
  final ProviderRefBase ref;

  String? _accessToken;
  String? get accessToken => _accessToken;

  List<Station> _stations = [];
  List<Station> get stations => _stations;

  Future<void> login(
      {required String mobileNum, required String password}) async {
    try {
      Credential _credential = Credential();
      _credential.mobile = mobileNum.trim();
      _credential.password = password.trim();
      _accessToken = await ref
          .read(priceLocqRepo)
          .fetchAccessToken(credential: _credential);
      debugPrint("AccessToken: $_accessToken");

      await getStationList();
    } catch (e) {
      throw "$e";
    }
  }

  Future<void> getStationList() async {
    _stations =
        await ref.read(priceLocqRepo).fetchAllStations(token: accessToken!);
    // debugPrint("Stations length: ${_stations.length}");
    // _stations.forEach((element) {
    //   print(element.name);
    // });
  }
}
