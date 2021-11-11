import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            // color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Text(
          "Trending Products",
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: 8)
      ],
    );
  }
}
