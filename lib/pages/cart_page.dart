import 'package:flutter/material.dart';
import 'package:install_check/core/store.dart';
import 'package:install_check/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:install_check/widgets/themes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          _CartList(),
          Divider(
            color: Theme.of(context).dividerColor,
          ),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return Container(
      height: context.percentHeight * 10,
      // color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VxConsumer(
              mutations: {RemoveMutation},
              notifications: {},
              builder: (context, store, status) {
                return Text("\$${_cart.totalPrice.toString()}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0));
              },
            ),
            // widget(
            //   child: Text("\$${_cart.totalPrice.toString()}",
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            // ),
            SizedBox(
              width: 100.0,
              // height: 0.0,
              child: ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Buying not supported yet",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Theme.of(context).dividerColor,
                        textColor: Theme.of(context).cardColor);
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //     content: Text("Buying not supported yet")));
                  },
                  child: Text("Buy"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    // fixedSize: MaterialStateProperty.all(Size(50, 40))
                    // backgroundColor: Theme.of(context).buttonTheme.buttoncolor),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () => RemoveMutation(_cart.items[index]),
            ),
            title: Text(_cart.items[index].name)),
      ),
    );
  }
}
