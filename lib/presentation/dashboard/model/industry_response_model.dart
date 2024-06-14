class Industry{
  final String imageUrl;
  final String title;
  final String description;

  Industry({required this.imageUrl, required this.title, required this.description});

  factory Industry.fromJson(Map<String, dynamic> json) {
    return Industry(
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
    );
  }
}