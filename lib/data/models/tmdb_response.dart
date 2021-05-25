import 'package:moviewebsite/data/models/movie.dart';

class TMDBResponse {
  TMDBResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  factory TMDBResponse.fromJson(Map<String, dynamic> json) => TMDBResponse(
        page: json['page'],
        results:
            List<Movie>.from(json['results'].map((x) => Movie.fromJson(x))),
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': List<dynamic>.from(results?.map((x) => x.toJson()) ?? []),
        'total_pages': totalPages,
        'total_results': totalResults,
      };
}
