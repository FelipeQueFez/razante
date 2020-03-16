import 'package:flutter/material.dart';
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
          onPressed: () {
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
