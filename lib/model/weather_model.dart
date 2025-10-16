class WeatherModel {
  final double tmep;
  final String weatherconition;
  final DateTime date;
  final String sunrise;
  final String sunset;
  final double mintemp;
  final double maxtemp;
  final String city;

  const WeatherModel({
    required this.tmep,
    required this.weatherconition,
    required this.date,
    required this.maxtemp,
    required this.mintemp,
    required this.sunrise,
    required this.sunset,
    required this.city,
  });

  factory WeatherModel.fromJson(jsonData) {
    return WeatherModel(
      city: jsonData['location']['name'],
      tmep: jsonData['current']['temp_c'],
      weatherconition: jsonData['current']['condition']['text'],
      date: DateTime.parse(jsonData['current']['last_updated']),
      maxtemp: jsonData['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: jsonData['forecast']['forecastday'][0]['day']['mintemp_c'],
      sunrise: jsonData['forecast']['forecastday'][0]['astro']['sunrise'],
      sunset: jsonData['forecast']['forecastday'][0]['astro']['sunset'],
    );
  }
}
