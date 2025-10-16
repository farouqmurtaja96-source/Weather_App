import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_v3/main.dart';
import 'package:weather_v3/model/hourly_forcast.dart';
import 'package:weather_v3/model/weather_model.dart';

class GetApi {
  Dio dio = Dio();

  Future<WeatherModel> getweather() async {
    // LocationPermission permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     throw Exception("Location permission denied");
    //   }
    // }

    // if (permission == LocationPermission.deniedForever) {
    //   throw Exception("Location permission permanently denied");
    // }
    // Position position = await Geolocator.getCurrentPosition();
    Position position = await _determinePosition();
    Response response = await dio.get(
      'https://api.weatherapi.com/v1/forecast.json?key=2d35435fd2ae4beca0b152035253006&q=${position.latitude},${position.longitude}',
    );

    print('${position.latitude} : ${position.longitude}');
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
    // Map<String, dynamic> jsondata = response.data;

    // List weather = jsondata['articles'];
    // List<WeatherModel> weather1 = [];

    // for (var weather in weather) {
    //   weather.add(WeatherModel.fromJson(weather));
    // }
    // return weather1;
  }

  forcast() async {
    Position position = await _determinePosition();
    Response response = await dio.get(
      'https://api.weatherapi.com/v1/forecast.json?key=2d35435fd2ae4beca0b152035253006&q=${position.latitude},${position.longitude}',
    );

    print('${position.latitude} : ${position.longitude}');
    // WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    // return weatherModel;
    Map<String, dynamic> json = response.data;

    List weathers = json['forecast']['forecastday'][0]['hour'];
    List<HourlyWeatherModel> weather1 = [];

    for (var weather in weathers) {
      weather1.add(HourlyWeatherModel.fromJson(weather));
    }
    return weather1;
  }

  Future<WeatherModel> serachCity(String cityName) async {
    try {
      Response response = await dio.get(
        'https://api.weatherapi.com/v1/forecast.json?key=2d35435fd2ae4beca0b152035253006&q=$cityName',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } catch (e) {
      print('❌ Error in serachCity: $e');
      throw Exception('فشل في جلب بيانات الطقس');
    }
  }
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
