import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_v3/cubit/weather_cubit.dart';
import 'package:weather_v3/widget/home_widget.dart';

class CitySerach extends StatelessWidget {
  const CitySerach({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherCitySerach) {
            return HomeWidget(
              weatherModel: state.weatherModel,
              hourlyWeatherModel: state.hourlyWeatherModel,
            );
          } else {
            return Text('opp there was an error');
          }
        },
      ),
    );
  }
}
