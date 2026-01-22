import 'package:flutter/material.dart';

import '../data/option_list.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<String> tabs = ['Summery', 'SLD', 'Data'];
  final List<String> data = ['Source', 'Load'];
  int tabIndex = 0;
  int dataIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2nd Page'),
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
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
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
                      Text('1st Page Navigate'),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,)
                    ],
                  )
              ),
              SizedBox(height: 12,),
              buildMainContainer(context),
              SizedBox(height: 12,),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 16,
                ),
                itemCount: grids.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFFB6B8D0),
                        width: 1,
                      )
                    ),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          grids[index].imageUrl,
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 8),
                        Text(
                          grids[index].title,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF646984)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildMainContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children:
            tabs.map(
                  (tab) => Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      tabIndex = tabs.indexOf(tab);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                      tabIndex == tabs.indexOf(tab)
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft:
                        tabIndex == 0
                            ? Radius.circular(12)
                            : Radius.circular(0),
                        topRight:
                        tabIndex == 2
                            ? Radius.circular(12)
                            : Radius.circular(0),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Text(
                        tab,
                        style: TextStyle(
                          color:
                          tabIndex == tabs.indexOf(tab)
                              ? Colors.white
                              : Color(0xFF646984),
                          fontWeight:
                          tabIndex == tabs.indexOf(tab)
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
                .toList(),
          ),
          Container(height: 1, width: double.infinity, color: Color(0xFFB6B0D0)),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Electricity',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF979797),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xFF979797),
                ),
                SizedBox(height: 25),
                Stack(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: CircularProgressIndicator(
                        value: 0.66,
                        strokeWidth: 25,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha(51),
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Total Power',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF04063E),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '5.53 kw',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF04063E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withAlpha(51),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children:
                    data
                        .map(
                          (item) => Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              dataIndex = data.indexOf(item);
                            });
                          },
                          child: Container(
                            decoration:
                            dataIndex == data.indexOf(item)
                                ? BoxDecoration(
                              color:
                              Theme.of(
                                context,
                              ).colorScheme.primary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            )
                                : null,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: Text(
                                item,
                                style: TextStyle(
                                  color:
                                  dataIndex == data.indexOf(item)
                                      ? Colors.white
                                      : Color(0xFF646984),
                                  fontWeight:
                                  dataIndex == data.indexOf(item)
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xFFA5A7B9),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 235,
                  child: Stack(
                    children: [
                      buildSourceListView(),
                      Positioned(
                        bottom: 3,
                        right: 0,
                        child: Container(
                          height: 28,
                          width: MediaQuery.of(context).size.width - 64,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Color(0x9919416E), Color(0x002F548C)],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView buildSourceListView() {
    return ListView.builder(
      shrinkWrap: false,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: sources.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(bottom: index != sources.length - 1 ? 8 : 2),
          decoration: BoxDecoration(
            color:
            index != sources.length - 1
                ? Color(0xFFE5F4FE)
                : Color(0xFFF0F1FF),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1, color: Color(0xFFA5A7B9)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                sources[index].image,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: sources[index].color,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width: 100,
                          child: Text(
                            sources[index].title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        sources[index].active ? '(Active)' : '(Inactive)',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color:
                          sources[index].active
                              ? Theme.of(context).colorScheme.primary
                              : Color(0xFFDF2222),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        index != sources.length - 1
                            ? 'Data 1     : '
                            : 'Live Power     : ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF646984),
                        ),
                      ),
                      Text(
                        index != sources.length - 1 ? '55505.63' : '55505.63 kW',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        index != sources.length - 1
                            ? 'Data 2     : '
                            : 'Today Energy : ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF646984),
                        ),
                      ),
                      Text(
                        index != sources.length - 1 ? '58805.63' : '58805.63 kWh',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24,
                color: Color(0xFF646984),
              ),
            ],
          ),
        );
      },
    );
  }
}
