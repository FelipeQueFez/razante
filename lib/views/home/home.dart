import 'package:flutter/material.dart';
import 'package:razante/views/books.dart';
import 'package:razante/views/home/list_items.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.perm_identity)),
            ],
          ),
          title: Text('Razante'),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.orange,
              child: ListItems(),
            ),
            Container(
              color: Colors.white,
              child: BookList(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
