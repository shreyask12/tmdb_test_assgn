import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_assigment/domain/models/movie_details_model.dart';
import 'package:tmdb_movie_assigment/domain/usecase/movies_usecase.dart';

import '../../domain/models/movies_model.dart';
import '../../network/dio_generics/resource.dart';
import '../../network/network_settings.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesUseCase moviesUseCase;

  MoviesBloc(this.moviesUseCase) : super(MoviesInitial()) {
    on<InitEvent>((event, emit) => _init(emit));
    on<TopRatedEvent>((event, emit) async => _getTopRatedMovies(emit));
    on<UpcomingEvent>((event, emit) async => _getUpcomingMovies(emit));
    on<MovieDetailsEvent>((event, emit) async => _getMovieDetails(event, emit));
  }

  final String imageBaseUrl = NetworkSettings.imageBaseUrl;

  MovieDetailsModel? movieDetails;

  Future<void> _init(Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    final popular = await _getPopularMovies();
    emit(MoviesListSuccess(popularMovies: popular));
    add(TopRatedEvent());
    add(UpcomingEvent());
  }

  Future<List<MoviesResultModel>> _getPopularMovies() async {
    final result = await moviesUseCase.getPopularMovies();

    if (result is Success) {
      final popularMoviesList =
          (result as Success<List<MoviesResultModel>>).data;
      return popularMoviesList;
    } else {
      return [];
    }
  }

  Future<void> _getTopRatedMovies(Emitter<MoviesState> emit) async {
    final result = await moviesUseCase.getTopRatedMovies();
    List<MoviesResultModel> topRated = [];
    if (result is Success) {
      topRated = (result as Success<List<MoviesResultModel>>).data;
    } else {
      topRated = [];
    }
    emit((state as MoviesListSuccess).copyWith(topRatedMovies: topRated));
  }

  Future<void> _getUpcomingMovies(Emitter<MoviesState> emit) async {
    final result = await moviesUseCase.getUpcomingMovies();
    List<MoviesResultModel> upcoming = [];
    if (result is Success) {
      upcoming = (result as Success<List<MoviesResultModel>>).data;
    } else {
      upcoming = [];
    }
    emit((state as MoviesListSuccess).copyWith(upcomingMovies: upcoming));
  }

  Future<void> _getMovieDetails(
      MovieDetailsEvent event, Emitter<MoviesState> emit) async {
    emit(MovieDetailsLoading());
    final result = await moviesUseCase.getMovieDetails(event.movieId);

    if (result is Success) {
      movieDetails = (result as Success<MovieDetailsModel>).data;
      emit(MovieDetailsSuccess(details: movieDetails!));
    } else {
      emit(MovieDetailsFailedState());
    }
  }

  String trailerUrl() {
    if (movieDetails != null) {
      final video = movieDetails?.videos?.results
          ?.where((element) => element.type == "Trailer")
          .toList()
          .first
          .key;
      final url = "${NetworkSettings.youtubeUrl}$video";
      return url;
    }
    return "";
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
