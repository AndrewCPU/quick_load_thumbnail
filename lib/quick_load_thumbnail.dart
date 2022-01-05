library quick_load_thumbnail;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class Thumper {
  static Future<String> getThumbnailPath(String videoPath) async {
    File file = File(videoPath + "-THUMB.png");
    if (!(await file.exists())) {
      final uint8list = await VideoThumbnail.thumbnailData(
        video: videoPath,
        imageFormat: ImageFormat.PNG,
      );
      await file.writeAsBytes(uint8list!);
    }
    return file.path;
  }

  static Future<Size> getImageDimensions(String imagePath) async {
    File file = File(imagePath);
    var decodedImage = await decodeImageFromList(file.readAsBytesSync());
    return Size(decodedImage.width.toDouble(), decodedImage.height.toDouble());
  }
}
