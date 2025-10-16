import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_v3/cubit/weather_cubit.dart';
import 'package:weather_v3/model/hourly_forcast.dart';
import 'package:weather_v3/model/weather_model.dart';
import 'package:weather_v3/views/city_serach.dart';
import 'package:weather_v3/views/serach_veiw.dart';
import 'package:weather_v3/widget/background_widget.dart';
import 'package:weather_v3/widget/detile_widget.dart';
import 'package:weather_v3/widget/forcast_list.dart';
import 'package:weather_v3/widget/weather_conition.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    required this.weatherModel,
    required this.hourlyWeatherModel,
  });
  final WeatherModel weatherModel;
  final List<HourlyWeatherModel> hourlyWeatherModel;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isSearchVisible = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, .9 * kToolbarHeight, 20, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              background_widget(x: 3, y: -0.1),
              background_widget(x: -3, y: -0.1),
              Align(
                alignment: AlignmentDirectional(0, -1.1),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(color: Colors.orange),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
              ),
      
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '📍 ${widget.weatherModel.city}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                
                        IconButton(
                          onPressed: () {
                          setState(() {
                            isSearchVisible =true;
                          });
                          },
                          icon: Icon(Icons.search, size: 35),
                        ),
                      ],
                    ),
                
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    WeatherConition(weatherModel: widget.weatherModel),
                    Center(
                      child: Text(
                        ' ${widget.weatherModel.tmep.round().toString()} C',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                
                    Center(
                      child: Text(
                        widget.weatherModel.weatherconition,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                
                    Center(
                      child: Text(
                        DateFormat('EEEE dd ').add_jm().format(widget.weatherModel.date),
                        // '${weatherModel.date.hour} : ${weatherModel.date.minute}',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 25),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: ForcastList(weatherModel: widget.hourlyWeatherModel),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DetileWidget(
                          image: 'assets/images/11.png',
                          name: 'sunrise',
                          time: '${widget.weatherModel.sunrise}',
                        ),
                        DetileWidget(
                          image: 'assets/images/12.png',
                          name: 'sunset',
                          time: '${widget.weatherModel.sunset}',
                        ),
                      ],
                    ),
                    Divider(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DetileWidget(
                          image: 'assets/images/13.png',
                          name: 'minTep',
                          time: '${widget.weatherModel.mintemp} c',
                        ),
                        DetileWidget(
                          image: 'assets/images/14.png',
                          name: 'maxTep',
                          time: '${widget.weatherModel.maxtemp} c',
                        ),
                      ],
                    ),
                
                
                  ],
                ),
              ),
              if(isSearchVisible)
                Positioned(
                  bottom: MediaQuery.of(context).size.height *.94,
                  right: 5,
                  left: 5,
                  child: Material(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
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
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Enter city name...',
                        prefixIcon: Icon(Icons.location_city),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              isSearchVisible = false;
                              controller.clear();
                            });
                          },
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      ),
                    ),
      
                  ),
                )
              ,
      
            ],
          ),
        ),
      ),
    );
  }
}
