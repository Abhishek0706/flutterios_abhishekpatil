import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterios_abhishekpatil/DoctorDetail.dart';
import 'package:flutterios_abhishekpatil/DoctorList.dart';
import 'package:flutterios_abhishekpatil/myDrawer.dart';

import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool light = true;
  bool switchState = false;
  late GoogleMapController _controller;

  List<String> _availability = [];
  String _fees = "1000";
  List<String> _speciality = [];
  List<String> _gender = [];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(22.7419562, 75.88835222),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Upcloud Technology',
      debugShowCheckedModeBanner: false,
      home: myHome(context),
      theme: light ? ThemeData.light() : ThemeData.dark(),
    );
  }

  void applyfilter(
    List<String> availability,
    String fees,
    List<String> speciality,
    List<String> gender,
  ) {
    setState(() {
      this._availability = availability;
      this._fees = fees;
      this._speciality = speciality;
      this._gender = gender;
    });
  }

  Widget myHome(BuildContext context) {
    return Scaffold(
      endDrawer: myDrawer(context, this.applyfilter),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Switch(
            value: switchState,
            onChanged: (value) {
              setState(() {
                light = !light;
                switchState = !switchState;
                changeMapMode();
              });
            },
          ),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.filter_list_sharp,
                size: 40,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          mapScreen(context),
          doctorList(
            context,
            getDoctorDetail(
              _availability,
              _fees,
              _speciality,
              _gender,
            ),
          ),
        ],
      ),
    );
  }

  Widget mapScreen(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
          changeMapMode();
          setState(() {});
        },
        zoomControlsEnabled: false,
        myLocationButtonEnabled: true,
      ),
    );
  }

  changeMapMode() {
    String temp = light ? "assets/lightMap.json" : "assets/darkMap.json";

    getJsonFile(temp).then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }
}
