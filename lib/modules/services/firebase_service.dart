import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:razante/modules/models/place_model.dart';

class FirebaseService {
  Future<String> uploadFile(File image) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('photos/${image.path.split('/').last}');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    var url = await storageReference.getDownloadURL();
    return url;
  }

  void createdPlace(PlaceModel model) async {
    await Firestore.instance.collection("places").document().setData({
      'title': model.title,
      'description': model.description,
      'url': model.url
    });
  }
}
