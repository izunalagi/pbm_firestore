class Character {
  String id;
  String name;
  String anime;
  String imageUrl;

  Character({
    required this.id,
    required this.name,
    required this.anime,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'anime': anime, 'imageUrl': imageUrl};
  }

  factory Character.fromMap(String id, Map<String, dynamic> map) {
    return Character(
      id: id,
      name: map['name'],
      anime: map['anime'],
      imageUrl: map['imageUrl'],
    );
  }
}
