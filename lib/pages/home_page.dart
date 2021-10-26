import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:install_check/models/catalog.dart';
import 'package:install_check/utils/routes.dart';
import 'package:install_check/widgets/drawer.dart';
import 'package:install_check/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  loadData() async {
    // await Future.delayed(Duration(seconds: 5)); // what if fetching data takes time (especially if comming from network instead of JSON file)
    final catalogJson =
        await rootBundle.loadString("resources/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);  // to test for multiple items in listview
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      // body: Padding(
      // padding: const EdgeInsets.all(20.0),
      //child:
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: CatalogModel.items.isNotEmpty
            ? ListView.builder(
                itemCount:
                    CatalogModel.items.length, // itemCount: dummyList.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatalogModel.items[index], // item: dummyList[index],
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: const MyDrawer(),
    );
  }
}
