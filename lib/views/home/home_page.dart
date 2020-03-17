import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:razante/modules/models/location_model.dart';
import 'package:razante/modules/services/place_service.dart';
import 'package:razante/views/home/widgets/info.dart';
import 'package:razante/views/home/widgets/list_items.dart';
import 'package:razante/views/place/place_add_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.info)),
            ],
          ),
          title: Text('Razante'),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.white,
              child: ListItems(),
            ),
            Container(
              color: Colors.white,
              child: InfoList(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {

            Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

            PlaceService service = new PlaceService();
            
            LocationModel model = new LocationModel();
            model.latitude = position.latitude.toString();
            model.longitude = position.longitude.toString();
            model.radius = 1500;
            model.type = 'restaurant';
            
            service.getPlaces(model);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlaceAddPage()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
