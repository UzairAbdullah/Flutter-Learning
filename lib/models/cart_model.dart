import 'package:install_check/core/store.dart';
import 'package:install_check/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newcatalog) {
    _catalog = newcatalog;
  }

  final List<int> _itemIds = [];

  // get items from catlog model to cart using their ids
  List<Item> get items =>
      _itemIds.map<Item>((e) => _catalog.getByID(e)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // void add(Item item) {
  //   _itemIds.add(item.Id);
  // }

  // void remove(Item item) {
  //   _itemIds.remove(item.Id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.Id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.Id);
  }
}
