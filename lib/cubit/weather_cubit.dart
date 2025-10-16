import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_v3/model/hourly_forcast.dart';
import 'package:weather_v3/model/weather_model.dart';
import 'package:weather_v3/services/get_api.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  WeatherModel? weatherModel;
  List<HourlyWeatherModel>? hourlyWeatherModel;
  fetchdata() async {
    emit(WeatherLoading());
    try {
      weatherModel = await GetApi().getweather();
      hourlyWeatherModel = await GetApi().forcast();
      print('object');
      emit(WeatherLoaded(weatherModel!, hourlyWeatherModel!));
      print(weatherModel?.city);
    } catch (e) {
      print("❌ Error in fetchdata: $e");
      emit(WeatherError());
    }
  }

  // forcast() async {
  //   emit(WeatherLoading());
  //   try {
  //     weatherModel = await GetApi().forcast();
  //     print('object');
  //     emit(WeatherLoaded(weatherModel!));
  //     print(weatherModel?.city);
  //   } catch (e) {
  //     print("❌ Error in fetchdata: $e");
  //     emit(WeatherError());
  //   }
  // }

  citySerach(String cityName) async {
    emit(WeatherLoading());
    try {
      weatherModel = await GetApi().serachCity(cityName);
      hourlyWeatherModel = await GetApi().forcast();
      print("✅ تم الحصول على بيانات الطقس: ${weatherModel!.city}");
      emit(WeatherCitySerach(weatherModel!, hourlyWeatherModel!));
    } catch (e) {
      print("❌ Error in citySerach: $e");
      emit(WeatherError());
    }
  }
}
