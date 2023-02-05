import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_movie_assigment/presentation/movies_details/movie_details_page.dart';

import '../../../domain/models/movies_model.dart';
import '../../bloc/movies_bloc.dart';
import 'movies_card.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection(
      {required this.bloc,
      required this.title,
      required this.movies,
      super.key});

  final MoviesBloc bloc;
  final String title;
  final List<MoviesResultModel> movies;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          MovieSectionTitleWidget(title: title),
          if (movies.isNotEmpty)
            SizedBox(
              height: 40.h,
              child: CupertinoScrollbar(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    cacheExtent: 1000,
                    itemBuilder: (context, index) {
                      return MoviesCard(
                        key: ValueKey(movies[index].id!),
                        id: movies[index].id!,
                        url: "${bloc.imageBaseUrl}${movies[index].posterPath}",
                        title: movies[index].title!,
                        isFirst: index == 0,
                        isLast: index == movies.length - 1,
                        releaseDate: movies[index].releaseDate ?? '',
                        userScore: movies[index].voteAverage!,
                        onTap: () {
                          bloc.add(
                            MovieDetailsEvent(movieId: "${movies[index].id}"),
                          );

                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  MovieDetailsPage(
                                      movieId: "${movies[index].id}"),
                            ),
                          );
                        },
                      );
                    }),
              ),
            )
          else
            SizedBox(
              height: 35.h,
            ),
        ],
      ),
    );
  }
}

class MovieSectionTitleWidget extends StatelessWidget {
  final String title;
  const MovieSectionTitleWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('section_header_key'),
      margin: const EdgeInsets.all(16),
      child: Text(title,
          key: const ValueKey('section_title_text'),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp)),
    );
  }
}
