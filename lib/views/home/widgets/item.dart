import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:razante/modules/models/place_model.dart';

class Item extends StatelessWidget {
  final PlaceModel model;
  final bool withDescription;

  const Item({Key key, @required this.model, this.withDescription = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: model.url,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          withDescription
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: Text(model.title),
                )
              : Container(),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}
