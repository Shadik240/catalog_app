import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:second2/core/store.dart';
import 'package:second2/models/cart.dart';
import 'package:second2/models/catalog.dart';
import 'package:second2/utils/routes.dart';
import 'package:second2/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, _, __) => FloatingActionButton(
            backgroundColor: MyTheme.darkBluisedColor,
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.CartRoute);
            },
            child: Icon(
              CupertinoIcons.cart,
            ),
          ).badge(
              color: Colors.green[300],
              size: 20,
              count: _cart.items.length,
              textStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != Null && CatalogModel.items.isNotEmpty)
                  if (CatalogModel.items.isNotEmpty)
                    CatalogList().expand()
                  else
                    Center(
                      child: CircularProgressIndicator(),
                    )
              ],
            ),
          ),
        ));
  }
}
