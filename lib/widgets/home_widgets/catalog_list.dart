import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:install_check/models/cart_model.dart';
import 'package:install_check/models/catalog.dart';
import 'package:install_check/pages/home_detail_page.dart';
import 'package:install_check/pages/home_page.dart';
import 'package:velocity_x/src/extensions/bool_ext.dart';

import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return VxBox(
    //     child: Row(
    //   children: [Image.network(catalog.Image)],
    // )).white.square(100).make().py16();

    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Container(
          //VxBox(         // Content to build same thing using Velocity_x package
          child: Row(
            children: [
              // Image.network(catalog.Image).box.rounded.color(MyThemes.creamColor).make().p16(),   //Content to build same thing using Velocity_x package
              Hero(
                  tag: Key(catalog.Id.toString()),
                  child: CatalogImage(
                    image: catalog.Image,
                  )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    catalog.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Text(catalog.desc,
                      style: Theme.of(context).textTheme.subtitle2
                      // style: TextStyle(
                      //     fontSize: 11,
                      //     color: Theme.of(context).textTheme.subtitle2),
                      ),
                  Expanded(
                      //Expanded used to align BUttonBar to bottom of the amin container containing individual items.
                      child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 7.0, bottom: 5.0),
                      child: ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        buttonPadding: EdgeInsets.zero,
                        children: [
                          Text("\$${catalog.price.toString()}"),
                          AddToCart(catalog: catalog)
                        ],
                      ),
                    ),
                  ))
                ],
              ))
            ],
          ),
          // color: Colors.white,
          width: 100,
          height: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).cardColor),
        ) //.square(100).white.make(),  //Content to build same thing using Velocity_x package
        );
  }
}
