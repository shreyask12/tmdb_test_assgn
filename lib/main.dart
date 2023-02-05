import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_movie_assigment/presentation/bloc/movies_bloc.dart';
import 'package:tmdb_movie_assigment/presentation/movies_home/movies_home_page.dart';

import 'dependency_injection/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  ServiceLocator().setUp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => MoviesBloc(locator.get())..add(InitEvent()),
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: const Color(0xFF41A721),
                primaryColorDark: const Color(0xFF1A422A),
                scaffoldBackgroundColor: const Color(0xFFFFFFFF),
              ),
              home: const MoviesContainerPage()),
        );
      },
    );
  }
}

class MoviesContainerPage extends StatelessWidget {
  const MoviesContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MoviesHomePage();
  }
}
