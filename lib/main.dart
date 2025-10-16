import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_v3/cubit/weather_cubit.dart';
import 'package:weather_v3/views/home_view.dart';

void main() {
  runApp(Weather_v3());
}

class Weather_v3 extends StatelessWidget {
  const Weather_v3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeView()),
    );
  }
}
