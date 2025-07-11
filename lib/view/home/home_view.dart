import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:uber_clone_app/common/color_extension.dart';
import 'package:uber_clone_app/common_widget/icon_title_subtitle_button.dart';
import 'package:uber_clone_app/view/home/tip_request_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isOpen = true;

  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
  );

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
            osmOption: OSMOption(
              userTrackingOption: const UserTrackingOption(
                enableTracking: true,
                unFollowUser: false,
              ),
              zoomOption: const ZoomOption(
                initZoom: 8,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
              userLocationMarker: UserLocationMaker(
                personMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.location_history_rounded,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
                directionArrowMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.double_arrow,
                    size: 48,
                  ),
                ),
              ),
              roadConfiguration: const RoadOption(
                roadColor: Colors.yellowAccent,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 40,
                      height: 40,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(35),
                      onTap: () {
                        context.push(const TipRequestView());
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: TColor.primary,
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "GO",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Image.asset("assets/img/current-location.png",
                              width: 30, height: 30),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 15),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isOpen = !isOpen;
                            });
                          },
                          icon: Image.asset(
                              isOpen
                                  ? "assets/img/open1.png"
                                  : "assets/img/close1.png",
                              width: 20,
                              height: 20),
                        ),
                        Text(
                          "You're offline",
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                    if (isOpen)
                      Container(
                        height: 0.5,
                        width: double.maxFinite,
                        color: TColor.placeHolder.withOpacity(0.5),
                      ),
                    if (isOpen)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: IconTitleSubtitleButton(
                                  title: "98.0%",
                                  subtitle: "Acceptance",
                                  icon: "assets/img/accepttance.png",
                                  onPressed: () {}),
                            ),
                            Container(
                              height: 100,
                              width: 0.5,
                              color: TColor.placeHolder.withOpacity(0.5),
                            ),
                            Expanded(
                              child: IconTitleSubtitleButton(
                                  title: "4.9",
                                  subtitle: "rating",
                                  icon: "assets/img/star.png",
                                  onPressed: () {}),
                            ),
                            Container(
                              height: 100,
                              width: 0.5,
                              color: TColor.placeHolder.withOpacity(0.5),
                            ),
                            Expanded(
                              child: IconTitleSubtitleButton(
                                  title: "2.9",
                                  subtitle: "cancellation",
                                  icon: "assets/img/cancellation2.png",
                                  onPressed: () {}),
                            ),
                          ],
                        ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 60,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 25),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$",
                              style: TextStyle(
                                color: TColor.secondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "234.5",
                              style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "assets/img/u1.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              constraints: const BoxConstraints(minWidth: 15),
                              child: const Text(
                                "3",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
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
}
