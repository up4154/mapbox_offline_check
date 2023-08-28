import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MapboxMap? mapboxMap;
  _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;
    await mapboxMap.style.addSource(VectorSource(
        id: "traffic", url: "mapbox://mapbox.mapbox-traffic-v1"));
    await mapboxMap.style.addLayerAt(
        LineLayer(
            id: "traffic",
            sourceId: "traffic",
            sourceLayer: "traffic",
            lineJoin: LineJoin.ROUND,
            lineCap: LineCap.ROUND,
            lineColor: Colors.red.value,
            lineWidth: 1.9),
        LayerPosition(above: "country-label"));
    await mapboxMap.style.addSource(VectorSource(
        id: "terrain-data", url: "mapbox://mapbox.mapbox-terrain-v2"));
    await mapboxMap.style.addLayerAt(
        LineLayer(
            id: "terrain-data",
            sourceId: "terrain-data",
            sourceLayer: "contour",
            lineJoin: LineJoin.ROUND,
            lineCap: LineCap.ROUND,
            lineColor: Colors.black.value,
            lineWidth: 1.9),
        LayerPosition(above: "country-label"));
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: MapWidget(
          cameraOptions: CameraOptions(
              center: Point(coordinates: Position(-80.1263, 25.7845)).toJson(),
              zoom: 12.0),
          styleUri: MapboxStyles.MAPBOX_STREETS,
          key: const ValueKey("mapWidget"),
          onMapCreated: _onMapCreated,
          resourceOptions: ResourceOptions(accessToken: "pk.eyJ1IjoidXRzYXYwMSIsImEiOiJjbGt0bTFsdzIwMWZoM2tsb3dkZHN0M2Z6In0.NVX_ZAS6j9Jn5e_5h3Z-CQ"),
        ));
  }
}
