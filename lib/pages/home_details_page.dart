import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second2/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import '../widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      //backgroundColor: MyTheme.creamColor,

      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.red800.bold.xl4.make(),
            AddToCart(catalog: catalog)
          ],
        ).p16(),
      ),

      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
              ).h32(context),
              Expanded(
                  child: VxArc(
                height: 25.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(MyTheme.darkBluisedColor)
                            .bold
                            .make(),
                        catalog.desc.text
                            .textStyle(context.captionStyle)
                            .xl
                            .make(),
                        10.heightBox,
                        "Elitr duo justo rebum et et amet ipsum sit et lorem. Dolores eos sit dolore sit, vero aliquyam amet justo et aliquyam aliquyam dolores elitr consetetur. Eirmod diam eirmod tempor takimata, lorem sed sit kasd kasd consetetur erat. Ipsum no et dolores dolor accusam, eos kasd ipsum ut tempor sanctus."
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .p16()
                      ],
                    ).py32()),
              ))
            ],
          )),
    );
  }
}
