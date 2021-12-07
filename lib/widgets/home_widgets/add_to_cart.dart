import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:install_check/models/cart_model.dart';
import 'package:install_check/models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (isInCart == false) {
            isInCart = !isInCart;
            final _catalog = CatalogModel();
            _cart.catalog = _catalog;
            _cart.add(catalog);
            // setState(() {});
          }
        },
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
        style: ButtonStyle(shape: MaterialStateProperty.all(StadiumBorder())
            //     MaterialStateProperty.all(Colors.cyan),
            // padding: MaterialStateProperty.all(EdgeInsets.only(right: 5)),
            ));
  }
}
