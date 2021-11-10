import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:install_check/models/catalog.dart';
import 'package:install_check/utils/routes.dart';
import 'package:install_check/widgets/drawer.dart';
import 'package:install_check/widgets/home_widgets/catalog_header.dart';
import 'package:install_check/widgets/home_widgets/catalog_image.dart';
import 'package:install_check/widgets/home_widgets/catalog_list.dart';
import 'package:install_check/widgets/item_widget.dart';
import 'package:install_check/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

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
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart),
          elevation: 2.0,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Expanded(
                  // Expanded used to bring circulat indicator in center vertically
                  child: Center(
                    // Center used to bring circulat indicator in center horizontally
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),

      // appBar: AppBar(                    gridview builder chapter
      //   title: const Text("Catalog App"),
      // ),
      // // body: Padding(
      // // padding: const EdgeInsets.all(20.0),
      // //child:
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      //   child: CatalogModel.items.isNotEmpty
      //       ? GridView.builder(
      //           // ignore: prefer_const_constructors
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2),
      //           itemCount: CatalogModel.items.length,
      //           itemBuilder: (context, index) {
      //             final Item = CatalogModel.items[index];
      //             return Card(
      //                 clipBehavior: Clip.antiAlias,
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(15)),
      //                 child: GridTile(
      //                   child: Image.network(Item.Image),
      //                   header: Container(
      //                     child: Text(
      //                       Item.name,
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                     padding: EdgeInsets.all(16),
      //                     color: Colors.cyan,
      //                   ),
      //                   footer: Container(
      //                     child: Text(Item.price.toString()),
      //                     padding: EdgeInsets.all(16),
      //                     color: Colors.grey.shade400,
      //                   ),
      //                 ));
      //           })
      //       // ListView.builder(               ListView builder chapter
      //       //     itemCount:
      //       //         CatalogModel.items.length, // itemCount: dummyList.length,
      //       //     itemBuilder: (context, index) {
      //       //       return ItemWidget(
      //       //         item: CatalogModel.items[index], // item: dummyList[index],
      //       //       );
      //       //     },
      //       //   )
      //      : Center(child: CircularProgressIndicator()),
      // ),
      // drawer: const MyDrawer(),
    );
  }
}
