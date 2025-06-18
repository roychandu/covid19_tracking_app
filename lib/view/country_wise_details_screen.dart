import 'package:flutter/material.dart';

class CountryWiseDetailsScreen extends StatefulWidget {
  const CountryWiseDetailsScreen({super.key});

  @override
  State<CountryWiseDetailsScreen> createState() =>
      _CountryWiseDetailsScreenState();
}

class _CountryWiseDetailsScreenState extends State<CountryWiseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: AppBar(title: Text('data'), centerTitle: true)),
    );
  }
}
