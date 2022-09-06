

import 'package:moviesplaylist/models/serial.dart';

class SerialData{
  final List<Serial> series;
  final int? total_pages;

  SerialData({
    required this.series,
    this.total_pages,
  });

  factory SerialData.fromJson(Map<String, dynamic> json) {
    final List<Serial> dataTemp = [];
    if (json['results'] != null) {
      for(var item in json['results']){
        dataTemp.add(Serial.fromJson(item as Map<String, dynamic>));
      }
    }
    if (json['cast'] != null) {
      for(var item in json['cast']){
        dataTemp.add(Serial.fromJson(item as Map<String, dynamic>));
      }
    }
    return SerialData(
      series: dataTemp,
      total_pages: json['total_pages'],
    );
  }
}