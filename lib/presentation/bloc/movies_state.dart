part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesInitial extends MoviesState {
  @override
  List<Object?> get props => [];
}

class MoviesLoading extends MoviesState {
  @override
  List<Object?> get props => [];
}

class MoviesListSuccess extends MoviesState {
  final List<MoviesResultModel>? upcomingMovies;
  final List<MoviesResultModel>? topRatedMovies;
  final List<MoviesResultModel>? popularMovies;

  const MoviesListSuccess(
      {this.popularMovies, this.topRatedMovies, this.upcomingMovies});

  MoviesListSuccess copyWith({
    List<MoviesResultModel>? popularMovies,
    List<MoviesResultModel>? topRatedMovies,
    List<MoviesResultModel>? upcomingMovies,
  }) {
    return MoviesListSuccess(
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
    );
  }

  @override
  List<Object?> get props => [
        popularMovies,
        topRatedMovies,
        upcomingMovies,
      ];
}

class MoviesFailState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class MovieDetailsSuccess extends MoviesState {
  final MovieDetailsModel details;

  const MovieDetailsSuccess({required this.details});

  MovieDetailsSuccess copyWith({MovieDetailsModel? model}) {
    return MovieDetailsSuccess(details: model ?? details);
  }

  @override
  List<Object?> get props => [details];
}

class MovieDetailsLoading extends MoviesState {
  @override
  List<Object?> get props => [];
}

class MovieDetailsFailedState extends MoviesState {
  @override
  List<Object?> get props => [];
}
