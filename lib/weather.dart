class Weather{
  final double tempC;
  final double tempF;
  final String condition;
  Weather({this.tempC=0, this.tempF=0, this.condition=' '});
  factory  Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      tempC: json['current']['temp_c'] as double,
      tempF: json['current']['temp_f'] as double,
      condition: json['current']['condition']['text'] as String,
    );
  }
}
