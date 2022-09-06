

import 'package:moviesplaylist/models/profile.dart';

class Cast{
  final int id;
  final int gender;
  final String name;
  final String profile_path;

  final String? biography;
  final String? place_of_birth;
  final String? known_for_department;
  final String? birthday;
  final String? deathday;

  final List<Profile>? profiles;

  Cast({
    required this.id,
    required this.gender,
    required this.name,
    required this.profile_path,

    this.biography,
    this.place_of_birth,
    this.known_for_department,
    this.birthday,
    this.deathday,
    this.profiles,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    final List<Profile> dataTemp = [];
    if (json['profiles'] != null) {
      for(var item in json['profiles']){
        dataTemp.add(Profile.fromJson(item as Map<String, dynamic>));
      }
    }
    return Cast(
      id: json['id'],
      gender: json['gender'] ?? 1,
      name: json['name'] ?? '',
      profile_path :json['profile_path'] ?? '',

      biography: json['biography'],
      place_of_birth: json['place_of_birth'],
      known_for_department: json['known_for_department'],
      deathday: json['deathday'],
      birthday: json['birthday'],
      profiles: dataTemp,
    );
  }

}