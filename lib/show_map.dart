import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';


class ShowMap extends StatefulWidget {
  const ShowMap({super.key});

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Polygon Loading"
        ),
      ),
      body:Container(

      )
    );
  }
}
