class Profile{
  final String file_path;


  Profile({
    required this.file_path,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      file_path: json['file_path'],
    );
  }


}