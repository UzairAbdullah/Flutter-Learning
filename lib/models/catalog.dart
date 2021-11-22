class CatalogModel {
  static final catModel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => catModel;

  static List<Item> items = [];

  //get element by id
  getByID(int id) =>
      items.firstWhere((element) => element.Id == id, orElse: null);

  // get element by position
  getByPosition(int pos) => items[pos];
}

class Item {
  final int Id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String Image;

  Item(
      {required this.Id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.Image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      Id: map["Id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      Image: map["Image"],
    );
  }

  toMap() => {
        "Id": Id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "Image": Image
      };
}
