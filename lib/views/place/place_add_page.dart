import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:razante/modules/models/place_model.dart';
import 'package:razante/modules/services/firebase_service.dart';
import 'package:razante/modules/shared/image_service.dart';
import 'package:razante/views/home/widgets/item.dart';

class PlaceAddPage extends StatefulWidget {
  @override
  _PlaceAddPageState createState() => _PlaceAddPageState();
}

class _PlaceAddPageState extends State<PlaceAddPage> {
  TextEditingController _titleController;
  TextEditingController _descriptionController;
  PlaceModel _model;
  FirebaseService _firebaseService;

  @override
  void initState() {
    _model = new PlaceModel();
    _firebaseService = new FirebaseService();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar lugar"),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.all(16),
        width: double.infinity,
        child: RaisedButton(
          child: Text(
            "Salvar",
            style: TextStyle(color: Colors.white),
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            if (_model.title == null ||
                _model.description == null ||
                _model.url == null) {
              //_showMessage('Informe os dados solicitados');
              return;
            }

            _firebaseService.createdPlace(_model);

            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Título"),
                  controller: _titleController,
                  onChanged: (value) {
                    _model.title = value;
                  },
                ),
              ),
              Container(height: 20),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Descrição"),
                  controller: _descriptionController,
                  onChanged: (value) {
                    _model.description = value;
                  },
                ),
              ),
              Container(height: 20),
              RaisedButton(
                child: Text("Selecionar Image"),
                onPressed: () async {
                  var image = await _getImage();

                  if (image != null) {
                    _model.url = await _uploadFile(image);

                    setState(() {
                      _model = _model;
                    });
                  }
                },
              ),
              Container(height: 20),
              _model.url != null
                  ? Item(
                      model: _model,
                      withDescription: false,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future<File> _getImage() async {
    ImageService service = new ImageService();
    return await service.getImageAsync();
  }

  Future<String> _uploadFile(File image) async {
    var url = await _firebaseService.uploadFile(image);
    return url;
  }

  //TODO:implement
  // void _showMessage(String message) {
  //   final snackBar = SnackBar(
  //     content: Text(message),
  //   );

  //   Scaffold.of(context).showSnackBar(snackBar);
  // }
}
