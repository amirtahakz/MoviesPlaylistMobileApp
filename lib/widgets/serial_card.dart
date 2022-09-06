import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:moviesplaylist/screens/serial_details_screen.dart';
import '../Utilities/styles.dart';

class SerialCard extends StatefulWidget {
  final int id;
  final String poster_path, title, Date;

  const SerialCard({
    Key? key,
    required this.id,
    required this.poster_path,
    required this.title,
    required this.Date,
  }) : super(key: key);

  @override
  _SerialCard createState() => _SerialCard();
}

class _SerialCard extends State<SerialCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SerialDtailsScreen(
                      idSerial: widget.id,
                    )));
      },
      child: Container(
        height: 160,
        width: 95,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: widget.poster_path.isEmpty
                  ? Image.asset('assets/images/moviePosterError.png')
                  : Image.network(
                      'https://image.tmdb.org/t/p/w500' + widget.poster_path),
            ),
            const Divider(height: 8),
            Text(
              widget.title,
              style: movieCardTextStyle,
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
