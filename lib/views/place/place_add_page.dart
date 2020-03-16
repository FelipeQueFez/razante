import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:razante/modules/shared/image_service.dart';

class PlaceAddPage extends StatefulWidget {
  @override
  _PlaceAddPageState createState() => _PlaceAddPageState();
}

class _PlaceAddPageState extends State<PlaceAddPage> {
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  @override
  void initState() {
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
          child: Text("Salvar"),
          onPressed: () {
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
                  //onChanged: _bloc.setName,
                ),
              ),
              Container(height: 20),
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Descrição"),
                  controller: _descriptionController,
                  //onChanged: _bloc.setName,
                ),
              ),
              Container(height: 20),
              RaisedButton(
                child: Text("Selecionar Image"),
                onPressed: () {
                  getImage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  getImage() async {
    ImageService service = new ImageService();
    var image = await service.getImageAsync();
  }
}
