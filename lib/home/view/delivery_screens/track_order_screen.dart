import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:beco_coffee/theme/theme.dart';
import 'package:beco_coffee/utilities/user_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  final Completer<GoogleMapController> mapFutureController = Completer();
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
  }

  Future<String> setMapTheme() async {
    ByteData byteData = await rootBundle.load('lib/theme/map_light_theme.json');
    final list = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    final jsonTheme = utf8.decode(list);
    return jsonTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon:
                Icon(Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back)),
        title: const Text('Track Order'),
      ),
      body: FutureBuilder(
          future: Future.wait([
            getUserLocation(),
            setMapTheme(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            final userLocation = snapshot.data![0] as LocationData;
            final mapTheme = snapshot.data![1] as String;

            return Stack(
              children: [
                GoogleMap(
                  style: mapTheme,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    zoom: 19,
                    target:
                        LatLng(userLocation.latitude!, userLocation.longitude!),
                  ),
                  onMapCreated: (controller) {
                    mapController = controller;
                  },
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.12,
                          decoration: const BoxDecoration(
                            color: kOnSecondaryContainer,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 40,
                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(10),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mr. John',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Food Delivery',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset('assets/icon/star.png'),
                                        const Gap(5),
                                        Text(
                                          '23 Rating',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: const Color.fromRGBO(
                                                    255, 193, 0, 1),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                      iconSize: 30,
                                      style: IconButton.styleFrom(
                                        backgroundColor:
                                            const Color.fromRGBO(228, 0, 82, 1),
                                      ),
                                      onPressed: () {},
                                      icon: const ImageIcon(
                                        AssetImage('assets/icon/chat.png'),
                                      ),
                                    ),
                                    const Gap(2),
                                    IconButton(
                                      iconSize: 30,
                                      style: IconButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            255, 193, 0, 1),
                                        foregroundColor: Colors.black,
                                      ),
                                      onPressed: () {},
                                      icon: const Icon(Icons.phone),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(10),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryContainer.withValues(
                              alpha: 0.8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fixedSize: const Size.fromHeight(60),
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          onPressed: () {
                            context.goNamed('order-detail');
                          },
                          child: const Text('Delivery 15 minutes'),
                        ),
                        const Gap(50),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
