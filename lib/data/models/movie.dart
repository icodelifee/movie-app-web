import 'package:moviewebsite/constants.dart';

class Movie {
  Movie({
    this.posterPath,
    this.id,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.releaseDate,
    this.adult,
    this.backdropPath,
    this.video,
    this.genreIds,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.mediaType,
  });

  String? posterPath;
  int? id;
  String? overview;
  double? voteAverage;
  int? voteCount;
  DateTime? releaseDate;
  bool? adult;
  String? backdropPath;
  bool? video;
  List<int>? genreIds;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  double? popularity;
  String? mediaType;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        posterPath: "${Constants.imageUrl}${json['poster_path']}",
        id: json['id'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
        releaseDate:
            DateTime.parse(json['release_date'] ?? json['first_air_date']),
        adult: json['adult'],
        backdropPath: "${Constants.imageUrl}${json['backdrop_path']}",
        video: json['video'],
        genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
        title: json['title'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        popularity: json['popularity'].toDouble(),
        mediaType: json['media_type'],
      );

  Map<String, dynamic> toJson() => {
        'poster_path': posterPath,
        'id': id,
        'overview': overview,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'release_date':
            '${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}',
        'adult': adult,
        'backdrop_path': backdropPath,
        'video': video,
        'genre_ids': List<dynamic>.from(genreIds?.map((x) => x) ?? []),
        'title': title,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'popularity': popularity,
        'media_type': mediaType,
      };
}
