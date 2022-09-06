import 'package:flutter/material.dart';
import 'package:moviesplaylist/models/profile.dart';
import 'package:moviesplaylist/screens/image_screen.dart';

class ImagesGrid extends StatefulWidget {
  final List<Profile> items;

  const ImagesGrid({Key? key, required this.items}) : super(key: key);

  @override
  _ImagesGridState createState() => _ImagesGridState();
}

class _ImagesGridState extends State<ImagesGrid> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: (50 / 75),
            crossAxisSpacing: 3,
            mainAxisSpacing: 9,
          ),
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(left: 2, right: 2),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500' +
                        widget.items[index].file_path,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ImageScreen(
                      imagePath: 'https://image.tmdb.org/t/p/w500' +
                          widget.items[index].file_path);
                }))
              },
            );
          }),
    );
  }
}
