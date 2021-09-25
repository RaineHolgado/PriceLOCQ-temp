import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_temp/screens/landing/landing_stateController.dart';
import 'package:pricelocq_temp/screens/login/login_statecontroller.dart';

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
        preferredSize: Size.fromHeight(90.0),
        child: AppBar(
          backgroundColor: Color(0xFF743BBC),
          centerTitle: true,
          title: Text("Search Station"),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.search),
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
              ? Text("${ref.read(landingProvider.notifier).errorMessage}")
              : Text("SUCESS");
        },
      ),
    );
  }
}
