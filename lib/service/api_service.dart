import 'dart:convert';

import 'package:foxbrain_task/model/country.dart';
import 'package:foxbrain_task/service/db_provider.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var client = http.Client();

  Future<void> get() async {
    // print(url);
    List<Country> country;
    try {
      http.Response response = await client.get(
        Uri.parse('https://restcountries.eu/rest/v2/lang/es'),
      );

      DBProvider.instance.deleteTable();

      country = (jsonDecode(response.body)).map((e) {
        var con = Country.fromJson(e);
        print(con);
        DBProvider.instance.create(con);
      }).toList();
      //return country;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<List<Country>?> getCountry() async {
    // print(url);
    List<Country> country;
    try {
      http.Response response = await client.get(
        Uri.parse('https://restcountries.eu/rest/v2/lang/es'),
      );

      country = (jsonDecode(response.body) as List)
          .map((e) => Country.fromJson(e))
          .toList();

      return country;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
