import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_movie_assigment/presentation/bloc/movies_bloc.dart';
import 'package:tmdb_movie_assigment/presentation/movies_home/widgets/movies_section.dart';

class MoviesHomePage extends StatefulWidget {
  const MoviesHomePage({super.key});

  @override
  State<MoviesHomePage> createState() => _MoviesHomePageState();
}

class _MoviesHomePageState extends State<MoviesHomePage> {
  late MoviesBloc bloc;

  @override
  void initState() {
    bloc = context.read<MoviesBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
          bloc: bloc,
          buildWhen: (previous, current) {
            return current is MoviesListSuccess ||
                current is MoviesFailState ||
                current is MoviesLoading;
          },
          builder: (context, state) {
            if (state is MoviesListSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.greenAccent,
                    title: Text(
                      'TMDB movies',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                  MoviesSection(
                    bloc: bloc,
                    title: 'Trending',
                    movies: state.popularMovies ?? [],
                  ),
                  MoviesSection(
                    bloc: bloc,
                    title: 'Popular',
                    movies: state.topRatedMovies ?? [],
                  ),
                  MoviesSection(
                    bloc: bloc,
                    title: 'Upcoming',
                    movies: state.upcomingMovies ?? [],
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                ],
              );
            } else if (state is MoviesLoading) {
              return SizedBox(
                height: 100.h,
                width: 100.w,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (state is MoviesFailState) {
              return SizedBox(
                height: 100.h,
                width: 100.w,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('SomeThing went wrong! Retry '),
                      IconButton(
                          onPressed: () {
                            bloc.add(InitEvent());
                          },
                          icon: const Icon(Icons.refresh))
                    ],
                  ),
                ),
              );
            } else {
              return SizedBox(
                height: 100.h,
                width: 100.w,
                child: const Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 3,
                )),
              );
            }
          },
        ),
      ),
    );
  }
}
