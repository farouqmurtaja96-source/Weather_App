import 'package:flutter/material.dart';
import 'package:weather_v3/model/weather_model.dart';

class WeatherConition extends StatelessWidget {
  const WeatherConition({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    final condition = weatherModel.weatherconition.toLowerCase();

    if (['sunny', 'clear', 'mostly clear'].contains(condition)) {
      return Center(child: Image.asset('assets/images/6.png', height: 260));
    } else if (['partly cloudy', 'cloudy', 'overcast'].contains(condition)) {
      return Center(child: Image.asset('assets/images/8.png', height: 260));
    } else if (['mist', 'fog'].contains(condition)) {
      return Center(child: Image.asset('assets/images/2.png', height: 260));
    } else if ([
      'patchy rain possible',
      'light rain',
      'moderate rain',
      'heavy rain',
      'rain',
    ].contains(condition)) {
      return Center(child: Image.asset('assets/images/3.png', height: 260));
    } else if ([
      'thundery outbreaks possible',
      'moderate or heavy rain with thunder',
      'patchy light rain with thunder',
    ].contains(condition)) {
      return Center(child: Image.asset('assets/images/1.png', height: 260));
    } else if ([
      'snow',
      'patchy snow possible',
      'blowing snow',
      'moderate snow',
    ].contains(condition)) {
      return Center(child: Image.asset('assets/images/2.png', height: 260));
    } else {
      return Center(child: Image.asset('assets/images/7.png', height: 260));
    }
  }
}
