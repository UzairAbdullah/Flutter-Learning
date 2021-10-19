import "package:flutter/material.dart";
import 'package:install_check/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.Image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        tileColor: Colors.grey.shade300,
        trailing: Text("\$${item.price}"),
      ),
    );
  }
}
