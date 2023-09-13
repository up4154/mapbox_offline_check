import 'dart:convert';

import 'package:flutter/services.dart';

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
    //         lineWidth: 2.9),
    //     LayerPosition(above: "country-label"));

    await mapboxMap.style.addSource(VectorSource(
        id: "terrain-data", url: "mapbox://mapbox.mapbox-terrain-v2"));
    await mapboxMap.style.addLayerAt(
        LineLayer(
            id: "terrain-data",
            sourceId: "terrain-data",
            sourceLayer: "contour",
            lineJoin: LineJoin.ROUND,
            lineCap: LineCap.ROUND,
            lineColor: Colors.red.value,
            lineWidth: 3.9),
            LayerPosition(above: "country-label"));
    // await mapboxMap.style.addSource(VectorSource(
    //     id: "terrain-data", url: "mapbox://mapbox.mapbox-terrain-v2"));
    // await mapboxMap.style.addLayerAt(
    //     LineLayer(
    //         id: "terrain-data",
    //         sourceId: "terrain-data",
    //         sourceLayer: "contour",
    //         lineJoin: LineJoin.ROUND,
    //         lineCap: LineCap.ROUND,
    //         lineColor: Colors.red.value,
    //         lineWidth: 3.9),
    //     LayerPosition(above: "country-label"));
    // await mapboxMap.style.addSource(VectorSource(
    //     id: "country-boundaries", url: "mapbox://mapbox.country-boundaries-v1"));
    // await mapboxMap.style.addLayerAt(
    //    FillLayer(
    //        id: "country-boundaries",
    //        sourceId: "country-boundaries",
    //      sourceLayer: "country_boundaries",
    //      fillColor: Colors.blue.value,
    //      fillOutlineColor: Colors.black.value
    //
    //    ),
    //     LayerPosition(above: "country-label"));

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
          cameraOptions: CameraOptions(
              center: Point(coordinates: Position( 73.0231944804388,
                  19.03310281044547)).toJson(),
              zoom: 16.0),
          styleUri: MapboxStyles.SATELLITE_STREETS,
          key: const ValueKey("mapWidget"),
          onMapCreated: _onMapCreated,
          resourceOptions: ResourceOptions(
              accessToken: "pk.eyJ1IjoidXRzYXYwMSIsImEiOiJjbGt0bTFsdzIwMWZoM2tsb3dkZHN0M2Z6In0.NVX_ZAS6j9Jn5e_5h3Z-CQ",
            // baseURL: "https://api.mapbox.com",
            // tileStoreUsageMode: TileStoreUsageMode.READ_ONLY
          ),
        ),
      );
  }
}
//    tileUrlList.add("mapbox://mapbox.mapbox-traffic-v1")
//    tileUrlList.add("mapbox://mapbox.mapbox-terrain-v2")