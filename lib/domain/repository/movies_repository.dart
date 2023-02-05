import 'package:tmdb_movie_assigment/domain/models/movie_details_model.dart';

import '../../network/dio_generics/resource.dart';
import '../models/movies_model.dart';

abstract class MoviesRepository {
  Future<Result<List<MoviesResultModel>>> fetchPopularMovies();

  Future<Result<List<MoviesResultModel>>> fetchTopRatedMovies();

  Future<Result<List<MoviesResultModel>>> fetchUpcomingMovies();

  Future<Result<MovieDetailsModel>> fetchMovieDetails(String movieId);
}
