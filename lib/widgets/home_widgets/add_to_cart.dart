import 'package:flutter/material.dart';
import 'package:second2/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // VxState.listen(context, to: [AddMutation]);
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(MyTheme.darkBluisedColor),
          backgroundColor: MaterialStateProperty.all(Colors.blue[500]),
          //shape: MaterialStateProperty.all(StadiumBorder())
        ),
        child: isInCart ? Icon(Icons.done) : "Add Cart".text.make());
  }
}
