import 'package:flutter/material.dart';
import 'package:uber_clone_app/common/color_extension.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class TipRequestView extends StatefulWidget {
  const TipRequestView({super.key});

  @override
  State<TipRequestView> createState() => _TipRequestViewState();
}

class _TipRequestViewState extends State<TipRequestView> with OSMMixinObserver {
  bool isOpen = true;

  late MapController controller;

  @override
  void initState() {
    controller = MapController(
      initPosition:
          GeoPoint(latitude: -4.879735305789491, longitude: 29.664623452429232),
    );
    controller.addObserver(this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OSMFlutter(
            controller: controller,
            osmOption: const OSMOption(
              enableRotationByGesture: true,
              zoomOption: ZoomOption(
                initZoom: 8,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
              staticPoints: [],
              roadConfiguration: RoadOption(
                roadColor: Colors.blueAccent,
              ),
              showDefaultInfoWindow: false,
            ),
            onMapIsReady: (isReady) {
              if (isReady) {
                print("Map is ready");
              }
            },
            onLocationChanged: (myLocation) {
              print("User location: $myLocation");
            },
            onGeoPointClicked: (myLocation) {
              print("GeopointClicked location: $myLocation");
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "25 min",
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "\$2.50",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "29 KM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/rate2.png",
                                  width: 15,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "3.5",
                                  style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: TColor.secondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text("1 Ash Park, Penbroke, UK",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 16,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: TColor.primary,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "56 Park Avenue, New York, USA",
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: TColor.primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "TAP TO ACCEPT",
                                style: TextStyle(
                                  color: TColor.primaryTextW,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "15",
                              style: TextStyle(
                                color: TColor.primaryTextW,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              )
            ],
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/img/closex.png",
                                width: 20,
                                height: 20,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "No Thanks",
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void addMarker() async {
    await controller.setMarkerOfStaticPoint(
      id: "pickup",
      markerIcon: MarkerIcon(
        iconWidget: Image.asset(
          "assets/img/pickup.png",
          width: 50,
          height: 50,
        ),
      ),
    );

    await controller.setMarkerOfStaticPoint(
      id: "dropoff",
      markerIcon: MarkerIcon(
        iconWidget: Image.asset(
          "assets/img/drop-off.png",
          width: 50,
          height: 50,
        ),
      ),
    );
    // -4.879735305789491, 29.664623452429232
    // -4.880818034591005, 29.667517394954896
    // -4.883069454728991, 29.667897787963863

    await controller.setStaticPosition(
        [GeoPoint(latitude: -4.879735305789491, longitude: 29.664623452429232)],
        "pickup");
    await controller.setStaticPosition(
        [GeoPoint(latitude: -4.883069454728991, longitude: 29.667897787963863)],
        "dropoff");
    loadMaproad();
  }

  // void addMarker() async {
  //   final pickupPoint = GeoPoint(
  //     latitude: -4.879735305789491,
  //     longitude: 29.664623452429232,
  //   );

  //   final dropoffPoint = GeoPoint(
  //     latitude: -4.883069454728991,
  //     longitude: 29.667897787963863,
  //   );

  //   // Set pickup marker
  //   await controller.setStaticPosition(
  //     [pickupPoint],
  //     "pickup",
  //   );

  //   await controller.setMarkerOfStaticPoint(
  //     id: "pickup",
  //     markerIcon: MarkerIcon(
  //       iconWidget: Image.asset(
  //         "assets/img/pickup.png",
  //         width: 64,
  //         height: 64,
  //       ),
  //     ),
  //   );

  //   // Set dropoff marker
  //   await controller.setStaticPosition(
  //     [dropoffPoint],
  //     "dropoff",
  //   );

  //   await controller.setMarkerOfStaticPoint(
  //     id: "dropoff",
  //     markerIcon: MarkerIcon(
  //       iconWidget: Image.asset(
  //         "assets/img/drop-off.png",
  //         width: 64,
  //         height: 64,
  //       ),
  //     ),
  //   );

  //   // Draw road
  //   await controller.drawRoad(
  //     pickupPoint,
  //     dropoffPoint,
  //     roadType: RoadType.car,
  //     roadOption: const RoadOption(
  //       roadColor: Colors.blueAccent,
  //       roadBorderWidth: 4,
  //       roadWidth: 5,
  //     ),
  //   );
  // }

  void loadMaproad() async {
    await controller.drawRoad(
      GeoPoint(latitude: -4.879735305789491, longitude: 29.664623452429232),
      GeoPoint(latitude: -4.883069454728991, longitude: 29.667897787963863),
      roadType: RoadType.car,
      roadOption: const RoadOption(
        roadColor: Colors.blueAccent,
        roadBorderWidth: 4,
        roadWidth: 5,
      ),
    );
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      addMarker();
    }
  }
}
