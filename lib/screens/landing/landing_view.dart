import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pricelocq_temp/app/router.gr.dart';
import 'package:pricelocq_temp/model/station.dart';
import 'package:pricelocq_temp/screens/landing/landing_stateController.dart';
import 'package:pricelocq_temp/screens/login/login_statecontroller.dart';
import 'package:pricelocq_temp/services/pricelocq_services.dart';

class LandingView extends ConsumerStatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  ConsumerState<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends ConsumerState<LandingView> {
  @override
  void initState() {
    ref.read(landingProvider.notifier).initLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild many times");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: AppBar(
          backgroundColor: Color(0xFF743BBC),
          centerTitle: true,
          title: Text("Search Station"),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                  onPressed: () {
                    context.router.push(SearchStationRoute());
                  },
                  icon: Icon(Icons.search)),
            ),
          ],
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Which PriceLOCQ station will you likely visit?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          print("running");
          final state = ref.watch(landingProvider);
          if (state == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return state == Status.error
              ? Center(
                  child: Text(
                      "${ref.read(landingProvider.notifier).errorMessage}"),
                )
              : GoogleLocation(
                  currentLoc:
                      ref.read(landingProvider.notifier).currentLocation,
                );
        },
      ),
    );
  }
}

class GoogleLocation extends ConsumerStatefulWidget {
  GoogleLocation({required this.currentLoc});
  final CameraPosition currentLoc;

  @override
  ConsumerState<GoogleLocation> createState() => _GoogleLocationState();
}

class _GoogleLocationState extends ConsumerState<GoogleLocation> {
  // Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;
  late List<Station> stations;
  @override
  void didChangeDependencies() {
    stations = ref
        .read(priceLocqServiceProvider)
        .sortedStation(widget.currentLoc.target);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final stateLocation = ref.watch(locationStateService);

    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          initialCameraPosition: widget.currentLoc,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            // _controllerGoogleMap.completeError(controller);
            newGoogleMapController = controller;
          },
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Container(
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nearby Stations",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text("Done"),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: StationListTile(
                    onTap: (CameraPosition cameraPosition) {
                      newGoogleMapController!.animateCamera(
                          CameraUpdate.newCameraPosition(cameraPosition));
                    },
                    currentLoc: widget.currentLoc.target,
                    stations: stations,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class StationListTile extends StatefulWidget {
  const StationListTile({
    Key? key,
    required this.stations,
    required this.onTap,
    required this.currentLoc,
  }) : super(key: key);
  final List<Station> stations;
  final Function(CameraPosition) onTap;
  final LatLng currentLoc;

  @override
  _StationListTileState createState() => _StationListTileState();
}

class _StationListTileState extends State<StationListTile> {
  late List<Station> _stations = widget.stations;
  int selectedRadio = -1;

  void onTapSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _stations.length,
      itemBuilder: (context, index) {
        return ListTile(
          dense: true,
          onTap: () {
            widget.onTap.call(_stations[index].stationPosition);
            onTapSelectedRadio(index);
          },
          title: Text(
            "${_stations[index].name}",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
              "${_stations[index].distanceValue(widget.currentLoc)} kilometer away from you"),
          trailing: Radio(
            value: index,
            groupValue: selectedRadio,
            onChanged: (val) {
              widget.onTap.call(_stations[index].stationPosition);
              onTapSelectedRadio(index);
            },
          ),
        );
      },
    );
  }
}
