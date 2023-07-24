import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .center
            .xl5
            .bold
            .color(MyTheme.darkBluisedColor)
            .make(),
        "Sample products".text.italic.xl2.make()
      ],
    );
  }
}
