import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pricelocq_temp/model/station.dart';
import 'package:pricelocq_temp/screens/landing/landing_stateController.dart';
import 'package:pricelocq_temp/services/pricelocq_services.dart';
import 'package:rxdart/rxdart.dart';

const _DEBOUNCE_TIME = 300;

final searchValue = StateProvider<String>((ref) {
  return "";
});

final streamProvider = StreamProvider<List<Station>>((ref) {
  var search = ref.watch(searchValue).state;

  BehaviorSubject<String> _querySearch = BehaviorSubject();
  _querySearch.add(search);

  var currentLoc = ref.read(landingProvider.notifier).currentLocation;

  return _querySearch.stream
      .debounceTime(Duration(milliseconds: _DEBOUNCE_TIME))
      .asyncMap((query) async {
    List<Station> stationList =
        ref.read(priceLocqServiceProvider).sortedStation(currentLoc.target);
    ;
    return query.isEmpty
        ? stationList
        : stationList
            .where((station) =>
                (station.area?.containsIgnoreCase(query) ?? false) ||
                (station.province?.containsIgnoreCase(query) ?? false) ||
                (station.city?.containsIgnoreCase(query) ?? false) ||
                (station.name?.containsIgnoreCase(query) ?? false))
            .toList();
  }).distinct();
});

extension CaseInsensitive on String {
  bool? containsIgnoreCase(String other) {
    return this.toLowerCase().contains(other.toLowerCase());
  }
}
