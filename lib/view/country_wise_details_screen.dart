import 'package:covid19_tracking_app/common_widgets/Reuseable_row.dart';
import 'package:flutter/material.dart';

class CountryWiseDetailsScreen extends StatefulWidget {
  String country_name, country_flag;
  int cases, deaths, recoverd, population, active, critical;

  CountryWiseDetailsScreen({
    required this.country_name,
    required this.country_flag,
    required this.cases,
    required this.deaths,
    required this.recoverd,
    required this.population,
    required this.active,
    required this.critical,
  });

  @override
  State<CountryWiseDetailsScreen> createState() =>
      _CountryWiseDetailsScreenState();
}

class _CountryWiseDetailsScreenState extends State<CountryWiseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.country_name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.065,
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        ReuseableRow(
                          title: 'Population : ',
                          value: widget.population.toString(),
                        ),
                        ReuseableRow(
                          title: 'Total Cases : ',
                          value: widget.cases.toString(),
                        ),
                        ReuseableRow(
                          title: 'Active Cases : ',
                          value: widget.active.toString(),
                        ),
                        ReuseableRow(
                          title: 'Critical Cases : ',
                          value: widget.critical.toString(),
                        ),
                        ReuseableRow(
                          title: 'Recoverd Cases : ',
                          value: widget.recoverd.toString(),
                        ),
                        ReuseableRow(
                          title: 'Deaths : ',
                          value: widget.deaths.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.country_flag.toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
