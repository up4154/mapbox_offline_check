import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';


class ShowMap extends StatefulWidget {
  const ShowMap({super.key});

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  MapboxMap? mapboxMap;
  _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap=mapboxMap;
print("on map created called in showmap widget");

    await mapboxMap.offline.cacheMapLayer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Polygon Loading"
        ),
      ),
      body: MapWidget(
        // cameraOptions: CameraOptions(
        //     center: Point(coordinates: Position( -280.0149017, 23.3220800)).toJson(),
        //     zoom: 12.0),
        // styleUri: MapboxStyles.MAPBOX_STREETS,
        key: const ValueKey("mapWidget"),
        onMapCreated: _onMapCreated,
        resourceOptions: ResourceOptions(
            accessToken: "pk.eyJ1IjoidXRzYXYwMSIsImEiOiJjbGt0bTFsdzIwMWZoM2tsb3dkZHN0M2Z6In0.NVX_ZAS6j9Jn5e_5h3Z-CQ"
        ),

      ),
    );;
  }
}
