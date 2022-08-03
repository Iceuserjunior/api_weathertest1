import 'dart:convert';
import 'package:http/http.dart';

const String apiKey = '4b08fd5586d4b37f60ba5fb7870aa27d';

class WeatherService {
  static Future<dynamic> getByCity({
     String cityName,
     String countryCode,
  }) async {
    Response response = await get(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'q': '$cityName,$countryCode',
          'appid': '$apiKey',
          'units': 'metric',
        },
      ),
    );
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return await json.decode(response.body);
    }
    throw 'No data for this city';
  }

  static Future<dynamic> getByCoordinate({
     double lon,
     double lat,
  }) async {
    Response response = await get(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'lon': '$lon',
          'lat': '$lat',
          'appid': '$apiKey',
          'units': 'metric',
        },
      ),
    );
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return await json.decode(response.body);
    }
    throw 'No data for this coordinate';
  }
}
