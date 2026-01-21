import 'package:flutter/material.dart';
import 'package:scube_task/data/option_list.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
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
              SizedBox(height: 10,),
              buildOptionsGridView(),
              SizedBox(height: 10,),

            ]
          ),
        )
      ),
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
