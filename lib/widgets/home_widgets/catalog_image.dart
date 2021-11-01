import 'package:flutter/cupertino.dart';
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
        ),
        width: context.percentWidth * 35,
        // padding: EdgeInsets.all(8),

        decoration: BoxDecoration(
            color: MyThemes.creamColor,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
