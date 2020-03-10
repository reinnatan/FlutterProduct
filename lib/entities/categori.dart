class Categori{
  final int id;
  final String name;

  Categori(this.id, this.name);

  factory Categori.fromJson(Map<String, dynamic> json) {
    return Categori(json['id'], json['name']);
  }
}