import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_v3/cubit/weather_cubit.dart';
import 'package:weather_v3/views/city_serach.dart';

class Serachveiw extends StatelessWidget {
  const Serachveiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              var weatherCubit = BlocProvider.of<WeatherCubit>(context);
              weatherCubit.citySerach(value);
              print(value);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CitySerach();
                  },
                ),
              );
            },
            decoration: InputDecoration(
              hint: Text('Serach City'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
