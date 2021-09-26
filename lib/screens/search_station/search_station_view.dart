import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_temp/screens/landing/landing_stateController.dart';
import 'package:pricelocq_temp/screens/landing/landing_view.dart';
import 'package:pricelocq_temp/screens/search_station/search_controller.dart';
import 'package:auto_route/auto_route.dart';

class SearchStationView extends ConsumerWidget {
  const SearchStationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final size = MediaQuery.of(context).size.width;
    // var searchP = ref.watch(searchProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
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
                    context.router.pop();
                  },
                  icon: Icon(Icons.close)),
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
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F4FB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black26),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 20),
                      border: InputBorder.none,
                    ),
                    onChanged: (String search) {
                      // searchP.search(search);
                      ref.read(searchValue).state = search;
                    },
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      body: Consumer(builder: (context, ref, _) {
        var streamStation = ref.watch(streamProvider);
        return streamStation.when(data: (data) {
          return StationListTile(
            onTap: (CameraPosition cameraPosition) {
              // newGoogleMapController!
              //     .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            },
            currentLoc:
                ref.read(landingProvider.notifier).currentLocation.target,
            stations: data,
          );
        }, loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        }, error: (e, s) {
          return Center(
            child: Text("$e"),
          );
        });
      }
          // body: Container(
          //   child: StreamBuilder<List<Station>>(
          //     initialData: [],
          //     stream: searchP.getStations(),
          //     builder: (context, data) {
          //       print("################################################");
          //       print(data.data);
          //       return StationListTile(
          //         onTap: (CameraPosition cameraPosition) {
          //           // newGoogleMapController!
          //           //     .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
          //         },
          //         currentLoc:
          //             ref.read(landingProvider.notifier).currentLocation.target,
          //         stations: data.data!,
          //       );
          //     },
          //   ),
          ),
    );
  }
}
