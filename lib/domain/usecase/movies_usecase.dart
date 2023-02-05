import 'package:tmdb_movie_assigment/domain/models/movies_model.dart';
import 'package:tmdb_movie_assigment/domain/repository/movies_repository.dart';

import '../../network/dio_generics/resource.dart';
import '../models/movie_details_model.dart';

class MoviesUseCase {
  final MoviesRepository moviesRepository;

  const MoviesUseCase(this.moviesRepository);

  Future<Result<List<MoviesResultModel>>> getPopularMovies() async {
    return moviesRepository.fetchPopularMovies();
  }

  Future<Result<List<MoviesResultModel>>> getTopRatedMovies() async {
    return moviesRepository.fetchTopRatedMovies();
  }

  Future<Result<List<MoviesResultModel>>> getUpcomingMovies() async {
    return moviesRepository.fetchUpcomingMovies();
  }

  Future<Result<MovieDetailsModel>> getMovieDetails(String movieId) async {
    return moviesRepository.fetchMovieDetails(movieId);
  }
}
