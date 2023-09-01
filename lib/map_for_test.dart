import 'main.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';


class MapForTest extends StatefulWidget {
  const MapForTest({super.key});

  @override
  State<MapForTest> createState() => _MapForTestState();
}

class _MapForTestState extends State<MapForTest> {
  MapboxMap? mapboxMap;
  _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;

    // print("$mapboxMap  +0000000000");
    //
    // await mapboxMap.style.addSource(VectorSource(
    //     id: "traffic", url: "mapbox://mapbox.mapbox-traffic-v1"));
    // await mapboxMap.style.addLayerAt(
    //     LineLayer(
    //         id: "traffic",
    //         sourceId: "traffic",
    //         sourceLayer: "traffic",
    //         lineJoin: LineJoin.ROUND,
    //         lineCap: LineCap.ROUND,
    //         lineColor: Colors.red.value,
    //         lineWidth: 1.9),
    //     LayerPosition(above: "country-label"));
    // await mapboxMap.style.addSource(VectorSource(
    //     id: "terrain-data", url: "mapbox://mapbox.mapbox-terrain-v2"));
    // await mapboxMap.style.addLayerAt(
    //     LineLayer(
    //         id: "terrain-data",
    //         sourceId: "terrain-data",
    //         sourceLayer: "contour",
    //         lineJoin: LineJoin.ROUND,
    //         lineCap: LineCap.ROUND,
    //         lineColor: Colors.black.value,
    //         lineWidth: 1.9),
    //     LayerPosition(above: "country-label"));
    print("called on map created before");
    String valueFromController =
    await mapboxMap.offline.cacheMapLayer();
    print("called on map created");
    print(valueFromController);
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: const Text(
            "Vector Source Map"
          ),
        ),
        body: MapWidget(
          // cameraOptions: CameraOptions(
          //     center: Point(coordinates: Position(75.739639,26.907524 )).toJson(),
          //     zoom: 12.0),
          // styleUri: MapboxStyles.MAPBOX_STREETS,
          key: const ValueKey("mapWidget"),
          onMapCreated: _onMapCreated,
          resourceOptions: ResourceOptions(accessToken: "pk.eyJ1IjoidXRzYXYwMSIsImEiOiJjbGt0bTFsdzIwMWZoM2tsb3dkZHN0M2Z6In0.NVX_ZAS6j9Jn5e_5h3Z-CQ"),
        ),
      );
  }
}
