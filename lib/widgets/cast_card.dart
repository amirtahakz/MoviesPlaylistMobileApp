import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:moviesplaylist/screens/cast_details_screen.dart';
import '../Utilities/styles.dart';

class CastCard extends StatefulWidget {
  final int id;
  final String name;
  final String profile_path;

  const CastCard({
    Key? key,
    required this.id,
    required this.name,
    required this.profile_path,
  }) : super(key: key);

  @override
  _CastCardState createState() => _CastCardState();
}

class _CastCardState extends State<CastCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{
        Navigator.push(context, MaterialPageRoute(builder: (context) => CastDetailsScreen(idCast: widget.id,)))
      },
      child: Container(
        height: 120,
        width: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              foregroundImage: NetworkImage('https://image.tmdb.org/t/p/w500'+widget.profile_path),
            ),
            Divider(height: 8),
            Text(widget.name== null ? '...': widget.name ,
              style: castCardTextStyle ,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
