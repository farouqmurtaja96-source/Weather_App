import 'package:flutter/material.dart';
import 'package:weather_v3/model/hourly_forcast.dart';

class WeatherConition1 extends StatelessWidget {
  const WeatherConition1({super.key, required this.weatherHour});
  final HourlyWeatherModel weatherHour;

  @override
  Widget build(BuildContext context) {
    final condition = weatherHour.condition
        .toLowerCase()
        .trim(); // مهم تحويل lowercase
    print('Condition: $condition');
    if (['sunny', 'clear', 'mostly clear'].contains(condition)) {
      return Center(
        child: Image.asset('assets/images/6.png', width: 60, height: 60),
      );
    } else if (['partly cloudy', 'cloudy', 'overcast'].contains(condition)) {
      return Center(child: Image.asset('assets/images/8.png', height: 80));
    } else if (['mist', 'fog'].contains(condition)) {
      return Center(child: Image.asset('assets/images/2.png', height: 80));
    } else if ([
      'patchy rain possible',
      'light rain',
      'moderate rain',
      'heavy rain',
      'rain',
    ].contains(condition)) {
      return Center(child: Image.asset('assets/images/3.png', height: 80));
    } else if ([
      'thundery outbreaks possible',
      'moderate or heavy rain with thunder',
      'patchy light rain with thunder',
    ].contains(condition)) {
      return Center(child: Image.asset('assets/images/1.png', height: 80));
    } else if ([
      'snow',
      'patchy snow possible',
      'blowing snow',
      'moderate snow',
    ].contains(condition)) {
      return Center(child: Image.asset('assets/images/2.png', height: 80));
    } else {
      return Center(child: Image.asset('assets/images/7.png', height: 80));
    }
  }
}
