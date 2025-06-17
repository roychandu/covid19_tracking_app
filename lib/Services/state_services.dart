import 'dart:convert';

import 'package:covid19_tracking_app/Models/world_states_model.dart';
import 'package:covid19_tracking_app/Services/Utilities/api_url.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<List<CovidReport>> world_Data_fucn() async {
    final response = await http.get(Uri.parse(Appurl.worldwiseApi));

    if (response.statusCode == 200) {
      List jsondata = jsonDecode(response.body);
      return jsondata.map((data) => CovidReport.fromJson(data)).toList();
    } else {
      throw Exception('Faild to fetching data!');
    }
  }
}
