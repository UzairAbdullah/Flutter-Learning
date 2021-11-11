import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:install_check/widgets/Themes.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Image.network(
          image,
          fit: BoxFit.contain,
        ),
        width: context.percentWidth * 35,
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
