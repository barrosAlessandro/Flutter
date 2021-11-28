class InfoPlants {
  final String id;
  final String name;
  final String image;
  final String description;
  final String price;
  final String carelevel;
  final String country;

  InfoPlants({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.carelevel,
    required this.country

  });

  factory InfoPlants.fromJson(Map<String, dynamic> json) {
    return InfoPlants(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        description: json['description'],
        price: json['price'],
        carelevel: json['carelevel'],
        country: json['country']
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "description": description,
    "price": price,
    "carelevel": carelevel,
    "country": country,
  };

}