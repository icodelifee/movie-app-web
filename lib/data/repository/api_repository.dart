import 'package:dio/dio.dart';
import 'package:moviewebsite/constants.dart';
import 'package:moviewebsite/data/models/genre.dart';
import 'package:moviewebsite/data/models/tmdb_response.dart';
import 'package:retrofit/http.dart';

part 'api_repository.g.dart';

@RestApi(baseUrl: Constants.apiUrl)
abstract class APIRepository {
  factory APIRepository(
    Dio dio,
  ) = _APIRepository;
  @GET('trending/all/day')
  Future<TMDBResponse> getTrending(@Query('api_key') String apiKey);

  @GET('movie/popular')
  Future<TMDBResponse> getPopular(@Query('api_key') String apiKey);
  
  @GET('genre/movie/list')
  Future<GenreResponse> getGenres(@Query('api_key') String apiKey);
}
