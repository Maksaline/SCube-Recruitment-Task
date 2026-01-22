import 'package:scube_task/models/temperature_model.dart';

Temperature getTemperature(DateTime time) {
  if(time.hour >= 6 && time.hour < 12) {
    return Temperature(
      temperature: 30,
      thermometer: 'assets/temp1.svg',
      image: 'assets/cloud.svg',
    );
  }
  else if(time.hour >= 12 && time.hour < 18) {
    return Temperature(
      temperature: 30,
      thermometer: 'assets/temp2.svg',
      image: 'assets/sun.svg',
    );
  }
  else {
    return Temperature(
      temperature: 19,
      thermometer: 'assets/temp3.svg',
      image: 'assets/moon.svg',
    );
  }
}