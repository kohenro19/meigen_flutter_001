class Meigen {
  int? id;
  String meigen;
  String author;


  // create constructor
  Meigen({
    this.id,
    required this.meigen,
    required this.author,
});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'meigen': meigen,
      'author': author
    };
  }

  factory Meigen.fromMap(Map<String, dynamic> json) => Meigen(
    id: json['id'],
    meigen: json['meigen'],
    author: json['author']
  );
}

