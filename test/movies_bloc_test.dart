//@dart=2.7
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb_movie_assigment/dependency_injection/service_locator.dart';
import 'package:tmdb_movie_assigment/domain/models/movies_model.dart';
import 'package:tmdb_movie_assigment/domain/usecase/movies_usecase.dart';
import 'package:tmdb_movie_assigment/network/dio_generics/resource.dart';
import 'package:tmdb_movie_assigment/presentation/bloc/movies_bloc.dart';
import 'package:mockito/mockito.dart';

void main() {
  locator = GetIt.instance;
  MockMoviesUseCase moviesUseCase;

  setUp(() {
    moviesUseCase = MockMoviesUseCase();

    locator.registerSingleton<MockMoviesUseCase>(moviesUseCase);
  });

  tearDown(() {
    locator.reset();
  });

  final moviesModel = [
    MoviesResultModel(
      id: 505642,
      voteCount: 1225,
      posterPath: "/ahsjhasjha",
      releaseDate: "2022-11-09",
      title: 'Black Panther',
      voteAverage: 7.5,
    ),
    MoviesResultModel(
      id: 505642,
      voteCount: 1225,
      posterPath: "/ahsjhasjha",
      releaseDate: "2022-11-09",
      title: 'Black Panther',
      voteAverage: 7.5,
    ),
    MoviesResultModel(
      id: 505642,
      voteCount: 1225,
      posterPath: "/ahsjhasjha",
      releaseDate: "2022-11-09",
      title: 'Black Panther',
      voteAverage: 7.5,
    )
  ];

  blocTest('check bloc renders movies success state on home page ',
      build: () => MoviesBloc(moviesUseCase),
      setUp: (() {
        when(moviesUseCase.getPopularMovies())
            .thenAnswer((realInvocation) async => Result.success(moviesModel));
        when(moviesUseCase.getTopRatedMovies())
            .thenAnswer((realInvocation) async => Result.success(moviesModel));
        when(moviesUseCase.getUpcomingMovies())
            .thenAnswer((realInvocation) async => Result.success(moviesModel));
      }),
      act: (bloc) => bloc.add(InitEvent()),
      expect: () => [
            isA<MoviesLoading>(),
            isA<MoviesListSuccess>(),
            isA<MoviesListSuccess>(),
            isA<MoviesListSuccess>(),
          ]);
}

class MockMoviesUseCase extends Mock implements MoviesUseCase {}
