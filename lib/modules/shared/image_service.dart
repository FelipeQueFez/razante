import 'package:image_picker/image_picker.dart';

class ImageService {
  getImageAsync() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }
}