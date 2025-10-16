import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_v3/cubit/weather_cubit.dart';
import 'package:weather_v3/model/hourly_forcast.dart';
import 'package:weather_v3/model/weather_model.dart';
import 'package:weather_v3/widget/forcast_conition.dart';

class ForcastList extends StatelessWidget {
  const ForcastList({super.key, required this.weatherModel});
  final List<HourlyWeatherModel> weatherModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoaded) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.hourlyWeatherModel.length,
            itemBuilder: (context, index) {
              final hour = state.hourlyWeatherModel[index];

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurpleAccent,
                  ),
                  width: 150,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WeatherConition1(weatherHour: hour),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${hour.time.hour}:${hour.time.minute} ',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            hour.tempC.toString(),
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is WeatherCitySerach) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.hourlyWeatherModel.length,
            itemBuilder: (context, index) {
              final hour = state.hourlyWeatherModel[index];

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurpleAccent,
                  ),
                  width: 150,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WeatherConition1(weatherHour: hour),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${hour.time.hour}:${hour.time.minute} ',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            hour.tempC.toString(),
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: Text('data'));
        }
      },
    );
  }
}
