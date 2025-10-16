class HourlyWeatherModel {
  final DateTime time;
  final double tempC;
  final String condition;

  HourlyWeatherModel({
    required this.time,
    required this.tempC,
    required this.condition,
  });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      time: DateTime.parse(json['time']),
      tempC: json['temp_c'].toDouble(),
      condition: json['condition']['text'],
    );
  }
}
