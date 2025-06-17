import 'dart:async';

import 'package:covid19_tracking_app/common_widgets/Reuseable_row.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            PieChart(
              dataMap: const {
                "Total Cases": 1000,
                "Recovered": 800,
                "Deaths": 200,
                "Active Cases": 100,
                "infected": 50,
              },
              // chart radius
              chartRadius: MediaQuery.of(context).size.width / 2.2,
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
                    ReuseableRow(title: 'Total', value: '20'),
                    ReuseableRow(title: 'Recovered', value: '15'),
                    ReuseableRow(title: 'Deaths', value: '2'),
                    ReuseableRow(title: 'Active Cases', value: '3'),
                    ReuseableRow(title: 'Infected', value: '5'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
