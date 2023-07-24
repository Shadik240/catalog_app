import 'package:second2/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel {
  //catalog field
  late CatalogModel _catalog;
  //CatalogModel _catalog = CatalogModel();

  //collection of IDS store ids of each item
  final List<int> _itemIds = [];

  //get gatalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    //assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getbyId(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

 
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
