import 'package:scube_task/models/option_model.dart';

import '../models/stats_model.dart';

final List<Option> options = [
  Option(
    imageUrl: 'assets/option1.png',
    title: '10000 kW',
    description: 'Live AC Power',
  ),
  Option(
    imageUrl: 'assets/option2.png',
    title: '82.58%',
    description: 'Plant Generation',
  ),
  Option(
    imageUrl: 'assets/option3.png',
    title: '85.61%',
    description: 'Live PR',
  ),
  Option(
    imageUrl: 'assets/option4.png',
    title: '27.58%',
    description: 'Cumulative PR',
  ),
  Option(
    imageUrl: 'assets/option5.png',
    title: '10000 ৳',
    description: 'Return PV',
  ),
  Option(
    imageUrl: 'assets/option6.png',
    title: '10000 kWh',
    description: 'Total Energy',
  ),
];

final List<StatData> stats = [
  StatData(
    label: 'AC Max Power',
    yesterday: '1636.50 kW',
    today: '2121.88 kW',
  ),
  StatData(
    label: 'Net Energy',
    yesterday: '6439.16 kWh',
    today: '4875.77 kWh',
  ),
  StatData(
    label: 'Specific Yield',
    yesterday: '1.25 kWh/kWp',
    today: '0.94 kWh/kWp',
  ),
  StatData(
    label: 'Net Energy',
    yesterday: '6439.16 kWh',
    today: '4875.77 kWh',
  ),
  StatData(
    label: 'Specific Yield',
    yesterday: '1.25 kWh/kWp',
    today: '0.94 kWh/kWp',
  ),
];

final List<Option> powers = [
  Option(
    imageUrl: 'assets/power2.png',
    title: 'Total AC Capacity',
    description: '3000 KW',
  ),
  Option(
    imageUrl: 'assets/power3.png',
    title: 'Total DC Capacity',
    description: '3.727 MWp',
  ),
  Option(
    imageUrl: 'assets/power4.png',
    title: 'Date of Commissioning',
    description: '17/07/2024'
  ),
  Option(
    imageUrl: 'assets/power5.png',
    title: 'Number of Inverter',
    description: '30'
  ),
  Option(
    imageUrl: 'assets/power2.png',
    title: 'Total AC Capacity',
    description: '3000 KW',
  ),
  Option(
    imageUrl: 'assets/power3.png',
    title: 'Total DC Capacity',
    description: '3.727 MWp',
  ),
];