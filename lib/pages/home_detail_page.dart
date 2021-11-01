import 'package:flutter/material.dart';
import 'package:install_check/models/catalog.dart';
import 'package:install_check/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      // appBar: AppBar(
      //   title: Text(catalog.name),
      //   backgroundColor: Colors.cyan,
      // ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${catalog.price.toString()}",
                style: TextStyle(fontSize: 23, color: Colors.red.shade800),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Buy"),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    fixedSize: MaterialStateProperty.all(Size(100, 45))),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Padding(
            // padding: const EdgeInsets.all(16.0),
            Hero(
              tag: Key(catalog.Id.toString()),
              child: Align(
                alignment: FractionalOffset.center,
                child: Image.network(
                  catalog.Image,
                  height: context.percentHeight * 35,
                ),
              ),
            ),
            Expanded(
                child: VxArc(
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    height: 20,
                    child: Container(
                      width: context.screenWidth,
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            catalog.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          Text(
                            catalog.desc,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
