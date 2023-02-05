import 'package:dio/dio.dart';
import 'package:tmdb_movie_assigment/domain/models/movies_model.dart';
import 'package:tmdb_movie_assigment/domain/repository/movies_repository.dart';
import 'package:tmdb_movie_assigment/network/dio_generics/resource.dart';

import '../domain/models/movie_details_model.dart';
import '../network/dio_generics/failure.dart';
import '../network/dio_generics/result_error.dart';
import '../network/dio_http_client.dart';
import 'data_config.dart';

class MoviesRepositoryImplementation extends MoviesRepository {
  final DioHttpClient dioHttpClient;
  final String? key;

  MoviesRepositoryImplementation({required this.dioHttpClient, this.key});

  @override
  Future<Result<List<MoviesResultModel>>> fetchPopularMovies() {
    return _getMovies(DataConfig.popularMovies);
  }

  @override
  Future<Result<List<MoviesResultModel>>> fetchTopRatedMovies() {
    return _getMovies(DataConfig.topRatedMovies);
  }

  @override
  Future<Result<List<MoviesResultModel>>> fetchUpcomingMovies() {
    return _getMovies(DataConfig.upComingMovies);
  }

  Future<Result<List<MoviesResultModel>>> _getMovies(String path) async {
    try {
      final response = await dioHttpClient.dio
          .get(path, queryParameters: _getQueryParameters());

      final bodyJson = response.data as Map<String, dynamic>;
      final result = MoviesModel.fromJson(bodyJson).results ?? [];

      return Result.success(result);
    } on ResultError catch (error) {
      return Result.rejected(error);
    } on DioError catch (error) {
      return Result.error(errorFrom(error));
    }
  }

  @override
  Future<Result<MovieDetailsModel>> fetchMovieDetails(String movieId) async {
    try {
      final response = await dioHttpClient.dio
          .get(movieId, queryParameters: _getMovieDetailsQueryParameters());

      final bodyJson = response.data as Map<String, dynamic>;
      final result = MovieDetailsModel.fromJson(bodyJson);

      return Result.success(result);
    } on ResultError catch (error) {
      return Result.rejected(error);
    } on DioError catch (error) {
      return Result.error(errorFrom(error));
    }
  }

  Failure errorFrom(DioError error) {
    return Failure.from(error);
  }

  Map<String, dynamic> _getQueryParameters() {
    return {
      "api_key": key,
      "language": "en-US",
      "page": "1",
    };
  }

  Map<String, dynamic> _getMovieDetailsQueryParameters() {
    return {
      "api_key": key,
      "language": "en-US",
      "append_to_response": "videos,recommendations,credits"
    };
  }
}
