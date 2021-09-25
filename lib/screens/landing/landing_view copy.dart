// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LandingView extends StatefulWidget {
//   const LandingView({Key? key}) : super(key: key);

//   @override
//   State<LandingView> createState() => _LandingViewState();
// }

// class _LandingViewState extends State<LandingView> {
//   Completer<GoogleMapController> _controllerGoogleMap = Completer();
//   GoogleMapController? newGoogleMapController;

//   Position? currentPosition;
//   Geolocator geolocator = Geolocator();
//   CameraPosition? cameraPosition;

//   @override
//   void initState() {
//     // locatePosition();
//     super.initState();
//   }

//   void locatePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       print('Location permissions are denied');

//       // return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.

//         // return Future.error('Location permissions are denied');
//         print('Location permissions are denied');
//       }
//     }

//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     currentPosition = position;
//     print(
//         "/////////////////////////////////////////////////////// $currentPosition");
//     // LatLng latLngPosition = LatLng(position.latitude, position.longitude);
//     const LatLng latLngPosition = LatLng(9.303167648260665, 123.30568746116519);

//     cameraPosition = CameraPosition(target: latLngPosition, zoom: 14.4746);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(90.0),
//         child: AppBar(
//           backgroundColor: Color(0xFF743BBC),
//           centerTitle: true,
//           title: Text("Search Station"),
//           elevation: 0,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Icon(Icons.search),
//             ),
//           ],
//           automaticallyImplyLeading: false,
//           flexibleSpace: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text(
//                   "Which PriceLOCQ station will you likely visit?",
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             mapType: MapType.normal,
//             myLocationButtonEnabled: true,
//             initialCameraPosition: CameraPosition(
//                 target: LatLng(9.303167648260665, 123.30568746116519),
//                 zoom: 16.47),
//             myLocationEnabled: true,
//             zoomGesturesEnabled: true,
//             zoomControlsEnabled: true,
//             onMapCreated: (GoogleMapController controller) {
//               _controllerGoogleMap.completeError(controller);
//               newGoogleMapController = controller;
//               locatePosition();
//             },
//           ),
//           Positioned(
//             left: 0.0,
//             right: 0.0,
//             bottom: 0.0,
//             child: Container(
//               height: 240,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: 5),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 14),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Nearby Stations",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         TextButton(
//                           onPressed: null,
//                           child: Text("Done"),
//                         )
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           for (var i = 0; i < 10; i++)
//                             ListTile(
//                               dense: true,
//                               onTap: () {
//                                 var test = CameraPosition(
//                                     target: LatLng(9.3003, 123.3049),
//                                     zoom: 16.47);
//                                 newGoogleMapController!.animateCamera(
//                                     CameraUpdate.newCameraPosition(test));
//                               },
//                               title: Text(
//                                 "SEAOIL INDEX $i - ADDRESS",
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               subtitle: Text("kilometer away from you"),
//                               trailing: Radio(
//                                 value: 1,
//                                 groupValue: 0,
//                                 onChanged: (val) {},
//                               ),
//                             )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
