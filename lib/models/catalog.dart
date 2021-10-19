class CatalogModel {
  static final items = [
    Item(
      Id: 01,
      name: "Iphone 12",
      desc: "12GB RAM, 164GB Rom",
      price: 999,
      color: "White",
      Image:
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-family-select-2021?wid=940&hei=1112&fmt=jpeg&qlt=80&.v=1617135051000",
    )
  ];
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
}
