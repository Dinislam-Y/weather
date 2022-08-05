// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:weather/data/models/info_days.dart';

//запрос информации о погоде за 3 дня
class DaysInfoRepository {
  final String _apiKey = "ae72b78a3620648f64652eaacc760dbe";

  Future fetch({
    required String city,
  }) async {
    Uri url = Uri.parse(
      "http://api.openweathermap.org/data/2.5/"
      "forecast?q=$city&lang=ru&units=metric&cnt=3&APPID=$_apiKey",
    );
    // запрос к базе данных
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // serialization
      final resultJson = jsonDecode(response.body);
      List<Info> result = [];
      //json parsing
      for (final map in resultJson["list"]) {
        result.add(Info.fromJson(map));
      }

      //сортировка по самой низкой температуре
      result.sort((a, b) {
        return a.main!.temp!.compareTo(b.main!.temp!);
      });
      return result;
    } else {
      //error обработка
      final resultJson = jsonDecode(response.body) as Map<String, dynamic>;

      return throw Exception(resultJson.values.last);
    }
  }
}
