import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageService {
  Future<File> getImageAsync() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }
}