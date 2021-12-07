import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:install_check/core/store.dart';
import 'package:install_check/models/cart_model.dart';
import 'package:install_check/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (isInCart == false) {
            AddMutation(catalog);
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
