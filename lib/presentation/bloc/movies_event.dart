part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class InitEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class TopRatedEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class UpcomingEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class MovieDetailsEvent extends MoviesEvent {
  final String movieId;

  const MovieDetailsEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
