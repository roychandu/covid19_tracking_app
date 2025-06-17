import 'dart:async';

import 'package:covid19_tracking_app/Models/world_states_model.dart';
import 'package:covid19_tracking_app/Services/state_services.dart';
import 'package:covid19_tracking_app/common_widgets/Reuseable_row.dart';
import 'package:covid19_tracking_app/view/counties_wise_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldWiseScreen extends StatefulWidget {
  const WorldWiseScreen({super.key});

  @override
  State<WorldWiseScreen> createState() => _WorldWiseScreenState();
}

class _WorldWiseScreenState extends State<WorldWiseScreen>
    with TickerProviderStateMixin {
  // Colors for pie chart
  final ColorList = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
  ];
  // AnimationController _controller;
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // call function
    StateServices stateServices = StateServices();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            FutureBuilder(
              future: stateServices.world_Data_fucn(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                    child: SpinKitFadingCircle(
                      color: Colors.black,
                      size: 50,
                      controller: _controller,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      PieChart(
                        dataMap: {
                          "Total Cases": double.parse(
                            snapshot.data!.cases!.toString(),
                          ),
                          "Recovered": double.parse(
                            snapshot.data!.recovered.toString(),
                          ),
                          "Deaths": double.parse(
                            snapshot.data!.deaths!.toString(),
                          ),
                          "Active Cases": double.parse(
                            snapshot.data!.active.toString(),
                          ),
                          "infected": double.parse(
                            snapshot.data!.todayCases!.toString(),
                          ),
                        },
                        // chart radius
                        chartRadius: MediaQuery.of(context).size.width / 2.2,
                        // convert data into percentage
                        chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                        // chart legend
                        legendOptions: const LegendOptions(
                          legendPosition: LegendPosition.left,
                          legendTextStyle: TextStyle(fontSize: 20),
                        ),
                        // chart animation
                        animationDuration: const Duration(seconds: 3),
                        // chart type
                        chartType: ChartType.ring,
                        // color list for pie chart
                        colorList: ColorList,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            children: [
                              ReuseableRow(
                                title: 'Total',
                                value: snapshot.data!.cases.toString(),
                              ),
                              ReuseableRow(
                                title: 'Recovered',
                                value: snapshot.data!.recovered!.toString(),
                              ),
                              ReuseableRow(
                                title: 'Deaths',
                                value: snapshot.data!.deaths!.toString(),
                              ),
                              ReuseableRow(
                                title: 'Active Cases',
                                value: snapshot.data!.active.toString(),
                              ),
                              ReuseableRow(
                                title: 'Infected',
                                value: snapshot.data!.todayCases.toString(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountiesWiseScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: Text(
                                'Track Counties',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
