import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_v3/cubit/weather_cubit.dart';
import 'package:weather_v3/widget/home_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    requestPermissionAndFetch();
  }

  void requestPermissionAndFetch() async {
    await Geolocator.requestPermission();
    BlocProvider.of<WeatherCubit>(context).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, State) {
          if (State is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (State is WeatherLoaded) {
            return HomeWidget(
              weatherModel: State.weatherModel,
              hourlyWeatherModel: State.hourlyWeatherModel,
            );
          } else {
            return Text('oops there was an error');
          }
        },
      ),
    );
  }
}











// Scaffold(
//       backgroundColor: Colors.black,
//       body: BlocBuilder<WeatherCubit, WeatherState>(
//         builder: (context, state) {
//           if (state is WeatherInitial) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is WeatherLoaded) {
//             return HomeWidget(
//               weatherModel: state.weatherModel,
//               hourlyWeatherModel: state.hourlyWeatherModel,
//             );
//           } else {
//             return Center(child: Text('opp there was an error'));
//           }
//         },
//       ),
//     );