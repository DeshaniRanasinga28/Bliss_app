class Data {
  Data({
    this.data,
  });

  List<Item> data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Item>.from(json["data"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Item {
  int id;
  String code;
  String image;
  String price;
  String height;
  String width;
  String weight;
  String cardcolor;
  String category;
  String color;
  String colors;
  bool favoriteProducts = false;
  int quantity;

  Item({
    this.id,
    this.code,
    this.image,
    this.price,
    this.height,
    this.width,
    this.weight,
    this.category,
    this.cardcolor,
    this.color,
    this.colors,
    this.favoriteProducts,
    this.quantity});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json["id"],
      code: json["code"],
      image: json["image"],
      price: json["price"],
      height: json["height"],
      width: json["width"],
      weight: json["weight"],
      category: json["category"],
      cardcolor: json["cardcolor"],
      color: json["color"],
      colors: json['colors'],
      favoriteProducts: false,
      quantity: 0);

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "image": image,
    "price": price,
    "height": height,
    "width": width,
    "weight": weight,
    "category": category,
    "cardcolor": cardcolor,
    "color": color,
    "colors" : colors
  };
}
