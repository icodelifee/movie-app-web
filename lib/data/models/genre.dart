class GenreResponse {
  GenreResponse({
    required this.genres,
  });

  List<Genre> genres;

  factory GenreResponse.fromJson(Map<String, dynamic> json) => GenreResponse(
        genres: List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'genres': List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
