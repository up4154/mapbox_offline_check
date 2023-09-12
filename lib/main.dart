import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:mapbox_offline_check/map_for_test.dart';
import 'package:mapbox_offline_check/offline_polygon.dart';
import 'package:mapbox_offline_check/offline_widget.dart';
import 'package:mapbox_offline_check/show_map.dart';

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
  final MethodChannel _channel = MethodChannel('simple_channel');
  // final MethodChannel _textChannel = MethodChannel('text_channel');

  void cacheMapFromKotlin()async{
    try {
      final String result = await _channel.invokeMethod('cacheMapLayer', 'Hello from Flutter!');
      print('Result from Kotlin: $result');
    } catch (e) {
      print('Error invoking method: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            "Mapbox Map Functionality Testing"
          ),
        ),
        body: Center(
          child: Column(
            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amberAccent,
                    height: 50,
                    width: 130,
                    child: const Center(
                      child: Text(
                        "show downloaded map"
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapForTest()));

                },
              ),

              GestureDetector(
                onTap: cacheMapFromKotlin,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amberAccent,
                    height: 50,
                    width: 120,
                    child: const Center(
                      child: Text(
                          "cache map view"
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }


}


