import 'package:covid19_tracking_app/Services/state_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

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
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
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
            Expanded(
              child: FutureBuilder(
                future: services.countryDataFunc(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index].country.toString();
                        if (searchController.text.isEmpty) {
                          print(snapshot.data![index].country);
                          return ListTile(
                            leading: Image(
                              width: 50,
                              height: 50,
                              image: NetworkImage(
                                snapshot.data![index].countryInfo!.flag
                                    .toString(),
                              ),
                            ),
                            title: Text(
                              snapshot.data![index].country.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Cases : ${snapshot.data![index].cases}',
                            ),
                          );
                        } else if (name.toLowerCase().contains(
                          searchController.text.toLowerCase(),
                        )) {
                          return ListTile(
                            leading: Image(
                              width: 50,
                              height: 50,
                              image: NetworkImage(
                                snapshot.data![index].countryInfo!.flag
                                    .toString(),
                              ),
                            ),
                            title: Text(
                              snapshot.data![index].country.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Cases : ${snapshot.data![index].cases}',
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade100,
                          highlightColor: Colors.grey.shade700,
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              color: Colors.white,
                            ),
                            title: Container(
                              width: 50,
                              height: 50,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              width: 50,
                              height: 50,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
