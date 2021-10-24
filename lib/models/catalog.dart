class CatalogModel {
  static List<Item> items = [];
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
