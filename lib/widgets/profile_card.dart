import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:moviesplaylist/screens/image_screen.dart';
import 'package:moviesplaylist/Utilities/styles.dart';

class ProfileCard extends StatefulWidget {
  final String profile_path;
  final String name;

  const ProfileCard({
    Key? key,
    required this.profile_path,
    required this.name,
  }) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          GestureDetector(
            child: CircleAvatar(
              radius: 65,
              foregroundImage: NetworkImage(
                  'https://image.tmdb.org/t/p/w500' + widget.profile_path),
              backgroundImage: const AssetImage('assets/images/profile.jpg'),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ImageScreen(
                    imagePath: 'https://image.tmdb.org/t/p/w500' +
                        widget.profile_path);
              }))
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.name,
              style: profileCardTextStyle,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
