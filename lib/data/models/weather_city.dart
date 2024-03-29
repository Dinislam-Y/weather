// Project imports:
import 'package:weather/data/models/clouds.dart';
import 'package:weather/data/models/coordinates.dart';
import 'package:weather/data/models/main_model.dart';
import 'package:weather/data/models/system.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/models/wind.dart';

class WeatherCity {
  Coordinates? coordinates;
  List<Weather>? weather;
  Main? main;
  num? visibility;
  Wind? wind;
  Clouds? clouds;
  DateTime? dt;
  Sys? sys;
  String? name;
  num? cod;

  WeatherCity({
    this.weather,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.name,
    this.cod,
  });

  factory WeatherCity.fromJson(Map<String, dynamic> json) {
    final List<Weather> weather = [];
    json['weather'].forEach((weatherJson) {
      weather.add(Weather.fromJson(weatherJson));
    });
    return WeatherCity(
      main: Main.fromJson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: DateTime.fromMillisecondsSinceEpoch(json['dt']),
      sys: Sys.fromJson(json['sys']),
      name: json['name'],
      cod: json['cod'],
      weather: weather,
    );
  }
}
