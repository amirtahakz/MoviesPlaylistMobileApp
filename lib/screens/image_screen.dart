import 'package:flutter/material.dart';
import 'package:moviesplaylist/utilities/files.dart';

class ImageScreen extends StatefulWidget {
  final String imagePath;
  const ImageScreen({
    Key? key,
    required this.imagePath
  }) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(Icons.file_download),
          onTap: ()=>{
            downloadImage(widget.imagePath)
          },
        )
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            widget.imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
