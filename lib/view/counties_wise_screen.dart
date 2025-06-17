import 'package:covid19_tracking_app/Services/state_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountiesWiseScreen extends StatefulWidget {
  const CountiesWiseScreen({super.key});

  @override
  State<CountiesWiseScreen> createState() => _CountiesWiseScreenState();
}

class _CountiesWiseScreenState extends State<CountiesWiseScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices services = StateServices();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search with country name',
                  contentPadding: EdgeInsets.only(left: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            FutureBuilder(future: services, builder: (context, snapshot) {}),
          ],
        ),
      ),
    );
  }
}
