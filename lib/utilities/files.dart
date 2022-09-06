import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

downloadImage(String imagePath) async {
  try {
    // Saved with this method.
    await ImageDownloader.downloadImage(imagePath,
        destination: AndroidDestinationType.directoryDownloads);
    // Below is a method of obtaining saved image information.
    // var fileName = await ImageDownloader.findName(imageId);
    // var path = await ImageDownloader.findPath(imageId);
    // var size = await ImageDownloader.findByteSize(imageId);
    // var mimeType = await ImageDownloader.findMimeType(imageId);
  } on PlatformException catch (error) {
    print(error);
  }
}
