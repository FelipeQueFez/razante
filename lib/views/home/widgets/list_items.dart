import 'package:flutter/material.dart';
import 'package:razante/views/home/widgets/item.dart';

class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, i) {
        return Item();
      },
    );
  }
}