import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sensors/sensors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = '';
  String proximityText = '';
  @override
  void initState() {
    super.initState();
    // Sensors.listenToLightSensor((value){
    //   setState(() {
    //     text = value;
    //   });
    // });
    Sensors.listenToProximitySensor((value){
      setState(() {
        proximityText = value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Lightness : $text \t Proximity : $proximityText'),
        ),
      ),
    );
  }
}
