import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:install_check/widgets/themes.dart';

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
    return Container(
      height: context.percentHeight * 10,
      // color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$9999",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            SizedBox(
              width: 100.0,
              // height: 0.0,
              child: ElevatedButton(
                  onPressed: () {},
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

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {},
            ),
            title: Text("Item 1")),
      ),
    );
  }
}
