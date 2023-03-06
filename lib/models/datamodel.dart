class Datamodel {
  String name;
  String image;
  int price;
  int review;
  String description;
  String location;
  Datamodel({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.location,
    required this.review,
  });
  factory Datamodel.fromJson(Map<String, dynamic> json) {
    return Datamodel(
        name: json["name"],
        price: json["price"],
        image: json["image"],
        description: json["description"],
        location: json["location"],
        review: json["review"]);
  }
}
