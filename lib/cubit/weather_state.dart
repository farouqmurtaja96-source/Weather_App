part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  WeatherModel weatherModel;
  List<HourlyWeatherModel> hourlyWeatherModel;
  WeatherLoaded(this.weatherModel, this.hourlyWeatherModel);
}

final class WeatherCitySerach extends WeatherState {
  WeatherModel weatherModel;
  List<HourlyWeatherModel> hourlyWeatherModel;
  WeatherCitySerach(this.weatherModel, this.hourlyWeatherModel);
}

final class WeatherError extends WeatherState {}
