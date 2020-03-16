import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:razante/modules/models/place_model.dart';
import 'package:razante/views/home/widgets/item.dart';

class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('places').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return ListView(
              children: snapshot.data.documents.map(
                (DocumentSnapshot document) {
                  var model = new PlaceModel();
                  model.description = document['description'];
                  model.title = document['title'];
                  model.url = document['url'];

                  return Item(
                    model: model,
                  );
                },
              ).toList(),
            );
        }
      },
    );
  }
}
