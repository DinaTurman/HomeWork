import 'package:flutter/material.dart';
import 'package:weather_homework/network/weather_service.dart';
import 'package:weather_homework/network//weather_model.dart';

class WeatherScreen extends StatefulWidget {
  final String city;

  WeatherScreen({required this.city});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = WeatherService('API_KEY').getWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in ${widget.city}'),
      ),
      body: FutureBuilder(
        future: weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            WeatherModel? weather;

            if (snapshot.hasData &&
                snapshot.data!['weather'] != null &&
                snapshot.data!['weather'][0] != null &&
                snapshot.data!['main'] != null) {
              weather = WeatherModel(
                city: widget.city,
                icon: snapshot.data!['weather'][0]['icon'],
                temperature: (snapshot.data!['main']['temp'] - 273.15),
              );
            } else {
              return Center(child: Text('Unexpected data format'));
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('City: ${weather!.city}'),
                Image.network('https://openweathermap.org/img/w/${weather.icon}.png'),
                Text('Temperature: ${weather.temperature.toStringAsFixed(2)} °C'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
