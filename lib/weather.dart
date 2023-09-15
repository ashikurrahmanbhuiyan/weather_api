class Weather{
  final double tempC;
  final double tempF;
  final String condition;
  Weather({this.tempC=0, this.tempF=0, this.condition=' '});
  factory  Weather.fromJson(Map<String, dynamic> wData){
    return Weather(
      tempC: wData['current']['temp_c'] as double,
      tempF: wData['current']['temp_f'] as double,
      condition: wData['current']['condition']['text'] as String,
    );
  }
}
