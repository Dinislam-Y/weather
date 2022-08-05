// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:weather/data/models/weather_city.dart';

//запрос текущей информации о погоде
class TodayRepository {
  final String _apiKey = "ae72b78a3620648f64652eaacc760dbe";

  Future fetch({required String city}) async {
    Uri url = Uri.parse(
      "http://api.openweathermap.org/data/2.5/"
      "weather?q=$city&lang=ru&units=metric&APPID=$_apiKey",
    );
    //database query
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //serialization
      final resultJson = jsonDecode(response.body);

      //json parsing
      return WeatherCity.fromJson(resultJson);
    } else {
      //error processing
      final resultJson = jsonDecode(response.body) as Map<String, dynamic>;

      return throw Exception(resultJson.values.last);
    }
  }
}
