import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scube_task/data/option_list.dart';
import 'package:scube_task/data/temperature_data.dart';
import 'package:scube_task/models/option_model.dart';
import 'package:scube_task/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late int temperature;
  late String thermometer;
  late String image;

  @override
  void initState() {
    super.initState();
    final temp = getTemperature(DateTime.now());
    temperature = temp.temperature;
    thermometer = temp.thermometer;
    image = temp.image;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1st Page'),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none_rounded, color: Color(0xFF646984),),
              ),
              Positioned(
                top: 14,
                right: 14,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red
                  )
                )
              )
            ],
          )
        ],
      ),
      backgroundColor: Color(0xFFD9E4F1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00C0E8),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(double.infinity, 50)
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('2nd Page Navigate'),
                    SizedBox(width: 10,),
                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,)
                  ],
                )
              ),
              SizedBox(height: 12,),
              buildOptionsGridView(),
              SizedBox(height: 12,),
              buildTemperatureContainer(context),
              SizedBox(height: 12,),
              buildDataTable(),
              SizedBox(height: 12,),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/power1.png', height: 22, fit: BoxFit.contain,),
                    SizedBox(width: 8,),
                    Text('Total Num of PV Module', style: TextStyle(fontSize: 10),),
                    SizedBox(width: 4,),
                    Text(
                      ': 6372 pcs.(585 Wp each)',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              buildSecondGridView(),
              SizedBox(height: 12,),
              buildLT01Container(context),
              SizedBox(height: 10,),
              buildLT01Container(context),
              SizedBox(height: 10,),
            ]
          ),
        )
      ),
    );
  }

  Container buildLT01Container(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFB9C6D6), width: 1),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'LT_01',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/energy.svg',
                    height: 16,
                    width: 16,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '495.505 kWp / 440 kW',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Container(
            height: 0.5,
            width: double.infinity,
            color: Color(0xFFAFCCDF),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 10),
              buildEnergyBox(
                Option(
                  imageUrl: 'assets/energy1.svg',
                  title: 'Lifetime Energy',
                  description: '352.96 MWh',
                ),
              ),
              SizedBox(width: 50),
              buildEnergyBox(
                Option(
                  imageUrl: 'assets/energy2.svg',
                  title: 'Today Energy',
                  description: '273.69 kWh',
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 10),
              buildEnergyBox(
                Option(
                  imageUrl: 'assets/energy3.svg',
                  title: 'Prev. Meter Energy',
                  description: '0.00 MWh',
                ),
              ),
              SizedBox(width: 50),
              buildEnergyBox(
                Option(
                  imageUrl: 'assets/energy4.svg',
                  title: 'Live Power',
                  description: '352.96 MWh',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox buildEnergyBox(Option option) {
    return SizedBox(
      height: 26,
      width: 120,
      child: Row(
        children: [
          SvgPicture.asset(
            option.imageUrl,
            height: 26,
            width: 26,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(option.title, style: TextStyle(fontSize: 8)),
              Text(
                option.description,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }


  GridView buildSecondGridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4.3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: powers.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: EdgeInsets.all(4),
          child: Row(
            children: [
              Image.asset(
                powers[index].imageUrl,
                width: 22,
                height: 22,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(powers[index].title, style: TextStyle(fontSize: 10)),
                  Text(
                    powers[index].description,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


  Container buildDataTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
            child: Row(
              children: [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 1,
                  child: Text("Yesterday's Data", style: TextStyle(fontSize: 12)),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Today's Data",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 0.5, width: double.infinity, color: Colors.black),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: stats.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: index % 2 == 0 ? Colors.transparent : Color(0xFFEEF3F9),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        stats[index].label,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        stats[index].yesterday,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        stats[index].today,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  SizedBox buildTemperatureContainer(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Stack(
          children: [
            buildGradientContainer(context),
            buildUpperContainer(context)
          ]
      ),
    );
  }

  Align buildUpperContainer(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width * 0.375,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$temperature°c', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),),
                  SizedBox(height: 4,),
                  Text(
                      'Module\nTemperature',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      )
                  )
                ],
              ),
              Spacer(),
              SvgPicture.asset(thermometer, width: 80, height: 80, fit: BoxFit.contain),
            ]
        ),
      ),
    );
  }

  Container buildGradientContainer(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF2E63F7),
              Color(0xFFB982D9),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(4),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.39,),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '26 MPH/NW',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                          'Wind Speed & Direction',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFFDDE5FF),
                          )
                      ),
                      Container(
                        height: 0.5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0x00FFFFFF),
                                  Color(0xFF728DF8),
                                  Color(0x00FFFFFF),
                                ]
                            )
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4),
                      ),
                      Text(
                        '15.20 w/m2',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                          'Effective Irradiation',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFFDDE5FF),
                          )
                      ),
                    ]
                ),
              ),
              SizedBox(width: 10,),
              SvgPicture.asset(image, width: 60, height: 60, fit: BoxFit.contain)
            ]
        )
    );
  }

  GridView buildOptionsGridView() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: options.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.all(2),
            child: Row(
              children: [
                Image.asset(options[index].imageUrl, width: 30, height: 30, fit: BoxFit.contain),
                SizedBox(width: 2,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(options[index].title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
                    Text(options[index].description, style: TextStyle(fontSize: 8, ))
                  ],
                )
              ],
            ),
          );
        }
    );
  }
}
