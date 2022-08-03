import 'package:api_weatherapp/models/weather_model.dart';
import 'package:flutter/material.dart';

const kCityName = TextStyle(
  fontSize: 40,
  color: Colors.blue,
  fontWeight: FontWeight.bold,
);
const kDetailsName = TextStyle(
  fontSize: 30,
  color: Color.fromARGB(255, 95, 87, 87),
  fontWeight: FontWeight.bold,
);

class WeatherDisplay extends StatelessWidget {
  WeatherDisplay({this.weatherData});
  final WeatherModel weatherData;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'พยากรณ์อากาศ',
              style: kDetailsName,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              '${weatherData.cityName}',
              style: kCityName,
            ),
          ),
          Container(
            child: Text(
              'ที่อยู่ปัจจุบัน/พื้นที่ค้นหา',
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 119, 113, 113)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: Image.network(
              'https://openweathermap.org/img/w/${weatherData.getIconName()}.png',
              scale: 0.3,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              '${weatherData.getDescription()}',
              style: TextStyle(fontSize: 40),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              '${weatherData.getTemp().toStringAsFixed(0)} °C',
              style: TextStyle(fontSize: 60),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Image.asset(
              'images/thermometer.png',
              scale: 7.5,
            ),
          )
        ],
      ),
    );
  }
}
