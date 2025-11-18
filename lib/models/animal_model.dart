class Animal {
  String id;
  String name;
  String image;
  String description;
  String type;
  bool isFavorite;

  Animal({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.type,
    this.isFavorite = false,
  });

  factory Animal.create({
    required String name,
    required String image,
    required String description,
    required String type,
  }) {
    return Animal(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      image: image,
      description: description,
      type: type,
    );
  }
}



