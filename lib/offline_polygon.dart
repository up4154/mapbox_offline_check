import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';


class OfflinePolygon extends StatefulWidget {
  const OfflinePolygon({super.key});

  @override
  State<OfflinePolygon> createState() => _OfflinePolygonState();
}
class AnnotationClickListener extends OnPolygonAnnotationClickListener {
  @override
  void onPolygonAnnotationClick(PolygonAnnotation annotation) {
    print("onAnnotationClick, id: ${annotation.id}");
  }
}

class _OfflinePolygonState extends State<OfflinePolygon> {
  MapboxMap? mapboxMap;
  PolygonAnnotation? polygonAnnotation;
  PolygonAnnotationManager? polygonAnnotationManager;

  List<List<Position>> listofPosition =[
    [
      Position(
          -280.1028124,
          23.32208
      ),
      Position(
          -285.6411816, 23.7250117
      ),


      Position(
          -285.0697626, 20.0146454
      ),


      Position(
          -279.5753486, 19.7253422
      ),

      Position(
          -280.0149017, 23.3220800
      ),
    ]
  ] ;
  _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap=mapboxMap;
    mapboxMap.annotations.createPolygonAnnotationManager().then((value) {
      polygonAnnotationManager = value;
      createOneAnnotation();
      var options = <PolygonAnnotationOptions>[];
      for (var i = 0; i < 2; i++) {
        options.add(PolygonAnnotationOptions(
            geometry:
            Polygon(coordinates: listofPosition).toJson(),
            fillColor:const Color.fromARGB(
                255,233,0,0)
                .value));
      }
      polygonAnnotationManager?.createMulti(options);
      polygonAnnotationManager
          ?.addOnPolygonAnnotationClickListener(AnnotationClickListener());
    });

    String valueFromController =
    await mapboxMap.offline.cacheMapLayer();
    print(valueFromController);
  }

  void createOneAnnotation() {
    print("creat funtcion called");
    polygonAnnotationManager
        ?.create(PolygonAnnotationOptions(
        geometry: Polygon(coordinates: listofPosition).toJson(),
        fillColor: Colors.red.value,
        fillOutlineColor: Colors.purple.value))
        .then((value) => polygonAnnotation = value);
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
        cameraOptions: CameraOptions(
            center: Point(coordinates: Position( -280.0149017, 23.3220800)).toJson(),
            zoom: 12.0),
        styleUri: MapboxStyles.MAPBOX_STREETS,
        key: const ValueKey("mapWidget"),
        onMapCreated: _onMapCreated,
        resourceOptions: ResourceOptions(
          accessToken: "pk.eyJ1IjoidXRzYXYwMSIsImEiOiJjbGt0bTFsdzIwMWZoM2tsb3dkZHN0M2Z6In0.NVX_ZAS6j9Jn5e_5h3Z-CQ"
        ),

      ),
    );
  }
}
