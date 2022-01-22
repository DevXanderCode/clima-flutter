import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=dd558343d3f6126f2adffdf1c28522b1');
    http.Response response = await http.get(url);
    // print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      int condition = decodedData['weather'][0]['id'];
      double temp = decodedData['main']['temp'];
      String cityName = decodedData['name'];

      print(condition);
      print(temp);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return const Scaffold();
  }
}
