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
        'https://api.openweathermap.org/data/2.5/weatherlat=35&lon=139&appid=0fd5c3dfae61e3978e62cf9c009149d9');
    http.Response response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
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
