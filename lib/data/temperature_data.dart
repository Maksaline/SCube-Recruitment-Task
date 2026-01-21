import 'package:flutter/material.dart';
import 'package:scube_task/models/temperature_model.dart';

Temperature getTemperature(DateTime time) {
  return Temperature(
    temperature: 30,
    height: 40,
    color: Colors.red,
    image: 'assets/sun.png',
  );
}