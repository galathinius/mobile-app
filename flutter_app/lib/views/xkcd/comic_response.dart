class Comic {
  final String title;
  final String alt;
  final String img;

  Comic({this.title, this.alt, this.img});

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      title: json['title'],
      alt: json['alt'],
      img: json['img'],
    );
  }
}
