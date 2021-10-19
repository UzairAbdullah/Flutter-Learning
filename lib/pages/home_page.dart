import 'package:flutter/material.dart';
import 'package:install_check/models/catalog.dart';
import 'package:install_check/utils/routes.dart';
import 'package:install_check/widgets/drawer.dart';
import 'package:install_check/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      // body: Padding(
      // padding: const EdgeInsets.all(20.0),
      //child:
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: ListView.builder(
          itemCount: CatalogModel.items.length, // itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index], // item: dummyList[index],
            );
          },
        ),
      ),
      // ),
      drawer: const MyDrawer(),
    );
  }
}
