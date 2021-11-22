import 'package:install_check/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

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

  void add(Item item) {
    _itemIds.add(item.Id);
  }

  void remove(Item item) {
    _itemIds.remove(item.Id);
  }
}
