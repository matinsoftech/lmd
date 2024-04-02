// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../utils/google_key.dart';

class OrderTrackingMap extends StatefulWidget {
  const OrderTrackingMap({super.key});

  @override
  State<OrderTrackingMap> createState() => _OrderTrackingMapState();
}

class _OrderTrackingMapState extends State<OrderTrackingMap> {
  final Completer<GoogleMapController> _controller = Completer();

  static LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static LatLng destinationLocation = LatLng(37.33429383, -122.06600055);
  static LatLng parcelpoint = LatLng(37.3339383, -122.04600055);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  List<String> listitems = [
    "SourceLocation",
    "DestinationLocation",
    "SourceLocation",
    "DestinationLocation",
    "SourceLocation",
    "DestinationLocation"
  ];

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor parcelIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });
  }

  void getPolyPoints() async {
    PolylinePoints polyLinePoints = PolylinePoints();
    PolylineResult result = await polyLinePoints.getRouteBetweenCoordinates(
        GoogleMapkey.googleApiKey,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) =>
            polylineCoordinates.add(LatLng(point.latitude, point.longitude)),
      );
      setState(() {});
    }
  }

// ...

  Future<void> setCustomMarkerIcon() async {
    Uint8List sourceIconBytes =
        await getBytesFromAsset('assets/Pin_source.png', 0, 0);
    Uint8List destinationIconBytes =
        await getBytesFromAsset('assets/Pin_destination.png', 0, 0);
    Uint8List parcelIconBytes =
        await getBytesFromAsset("assets/parcel.png", 60, 60);

    sourceIcon = BitmapDescriptor.fromBytes(sourceIconBytes);
    destinationIcon = BitmapDescriptor.fromBytes(destinationIconBytes);
    parcelIcon = BitmapDescriptor.fromBytes(parcelIconBytes);
  }

  Future<Uint8List> getBytesFromAsset(
      String path, int width, int height) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: height,
      targetWidth: width,
    );
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // void setCustomMarkerIcon(){
  //   BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration.empty,"assets/Pin_source.png"
  //     ).then((icon){
  //       sourceIcon = icon;
  //     });

  //     BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration.empty,"assets/Pin_destination.png"

  //       ).then((icon){
  //         destinationIcon = icon;
  //       });
  // }
  @override
  void initState() {
    // getCurrentLocation();
    setCustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: IconButton(
        //     onPressed: (){
        //       Navigator.pop(context);
        //     },
        //     icon:CircleAvatar(
        //       backgroundColor: Colors.white,
        //       child:const Icon(
        //         Icons.arrow_back,
        //         color:Colors.black,
        //       )
        //     )
        //   ),
        // ),
        body: Stack(
      children: [
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight * 0.73,
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: parcelpoint, zoom: 13),
              // onCameraMove: (CameraPosition position){
              //   setState(() {
              //     parcelpoint = position.target;
              //   });
              // },
              polylines: {
                Polyline(
                    polylineId: PolylineId("route"),
                    points: polylineCoordinates,
                    color: Palette.primarycolor,
                    width: 3),
              },
              markers: {
                Marker(
                  markerId: MarkerId("parcelpoint"),
                  position: parcelpoint,
                  icon: parcelIcon,
                ),
                Marker(
                  markerId: MarkerId("source"),
                  position: sourceLocation,
                  icon: sourceIcon,
                ),
                Marker(
                    markerId: MarkerId("destination"),
                    position: destinationLocation,
                    icon: destinationIcon)
              },
            ),
          );
        }),

        Positioned(
            top: 50,
            left: 15,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )),
        //ScrollSheet
        DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: ListView(
                  controller: scrollController,
                  children: [
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment,
                    //   children: [
                    //   SizedBox(
                    //     width:50,
                    //     child: Divider(
                    //       thickness: 5,
                    //     ),
                    //    ),
                    // ],),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order ID",
                                  style: TextStyle(color: Colors.black54)),
                              Text("#956367836",
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Package Category",
                                  style: TextStyle(color: Colors.black54)),
                              Text("Documents", style: TextStyle(fontSize: 16))
                            ],
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 15),
                    //Contact Driver
                    Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Palette.fillgreenColor2,
                        ),
                        child: ListTile(
                            leading: CircleAvatar(
                                radius: 25,
                                child: Icon(Icons.person, size: 30)),
                            title: Text("Amanda Lockwood",
                                style: TextStyle(fontSize: 16)),
                            subtitle: Text("Delivery Person",
                                style: TextStyle(color: Colors.black54)),
                            trailing: Container(
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Palette.primarycolor, width: 2),
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.phone,
                                        color: Palette.primarycolor))))),

                    //status of the package
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Status: ",
                            style: TextStyle(color: Colors.black54)),
                        TextSpan(text: "On the way"),
                      ])),
                    ),

                    //package Detail button
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          width: mq.width,
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                            color: Palette.primarycolor,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Center(
                              child: Text("Package Details",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)))),
                    ),
                  ],
                ),
              );
            })
      ],
    ));
  }
}
