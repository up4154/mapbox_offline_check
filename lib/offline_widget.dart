import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';


class OfflineWidget extends StatelessWidget {
   OfflineWidget({super.key});
  
  MapboxMap? mapboxMap;


  _offlineLoading(MapboxMap mapboxMap) async {

    this.mapboxMap=mapboxMap;

    String offlineLoadedData = await mapboxMap.offline.cacheMapLayer();

    print(offlineLoadedData);



  }

   Map<String, dynamic> jsonData = {
     "type": "Polygon",
     "coordinates": [
       [
         [-122.41857910156249, 37.76023484134737],
         [-122.42177963256836, 37.75422679365761],
         [-122.40983009338379, 37.75363563119239],
         [-122.40655899047852, 37.75897167811799],
         [-122.41857910156249, 37.76023484134737]
       ]
     ]
   };



  @override


  Widget build(BuildContext context) {


    String jsonString = jsonEncode(jsonData);
    return Container();
  }
}
