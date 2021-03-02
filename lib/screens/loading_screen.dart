import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '5f3b441e8ee65a50bb8d72b6dde3142e';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();

    getLocation();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    double temperature = decodedData['main']['temp'];
    int condition = decodedData['weather'][0]['id'];
    String cityName = decodedData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
