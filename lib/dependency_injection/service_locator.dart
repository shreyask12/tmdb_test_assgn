import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb_movie_assigment/data/movies_repository_impl.dart';
import 'package:tmdb_movie_assigment/domain/repository/movies_repository.dart';
import 'package:tmdb_movie_assigment/domain/usecase/movies_usecase.dart';
import 'package:tmdb_movie_assigment/network/dio_http_client.dart';
import 'package:tmdb_movie_assigment/network/network_settings.dart';

GetIt locator = GetIt.instance;

class ServiceLocator {
  void setUp() {
    _setUpDio();
    _setUpRepository();
    _setUpUseCase();
  }

  void _setUpDio() {
    locator.registerSingleton<DioHttpClient>(
        const DioHttpClient(baseUrl: NetworkSettings.baseUrl));
  }

  void _setUpRepository() {
    locator.registerSingleton<MoviesRepository>(MoviesRepositoryImplementation(
        dioHttpClient: locator.get(), key: dotenv.env['TMDB_KEY']));
  }

  void _setUpUseCase() {
    locator.registerSingleton<MoviesUseCase>(MoviesUseCase(locator.get()));
  }
}
