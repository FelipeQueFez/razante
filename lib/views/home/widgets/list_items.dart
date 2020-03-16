import 'package:flutter/material.dart';
import 'package:razante/modules/models/place_model.dart';
import 'package:razante/views/home/widgets/item.dart';

class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, i) {
        var model = new PlaceModel();
        model.description = "Test";
        model.title = "Test";
        model.url = "https://placeimg.com/640/480/any";
        
        return Item(model: model,);
      },
    );
  }
}