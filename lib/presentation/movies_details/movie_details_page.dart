import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_movie_assigment/presentation/utils/helper_methods.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc/movies_bloc.dart';
import '../movies_home/widgets/cast_card.dart';
import '../movies_home/widgets/recommendations_card.dart';
import 'poster_image_view.dart';

class MovieDetailsPage extends StatefulWidget {
  final String movieId;
  const MovieDetailsPage({required this.movieId, super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
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
            return current is MovieDetailsSuccess ||
                current is MovieDetailsLoading ||
                current is MovieDetailsFailedState;
          },
          builder: (context, state) {
            if (state is MovieDetailsSuccess) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 36.h,
                    backgroundColor: const Color(0x4949B356),
                    pinned: true,
                    // floating: true,
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(0),
                      child: SizedBox.shrink(),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: RepaintBoundary(
                        child: PosterImageView(
                            imageUrl:
                                "${bloc.imageBaseUrl}${state.details.backdropPath}",
                            posterPathUrl:
                                "${bloc.imageBaseUrl}${state.details.posterPath}"),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          color: Colors.black87,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: RichText(
                                  text: TextSpan(
                                    text: '${state.details.originalTitle}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                        ),
                                    children: [
                                      TextSpan(
                                        text:
                                            ' ${getReleaseYear(state.details.releaseDate!)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Colors.white60,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, bottom: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          CircularPercentIndicator(
                                            radius: 20.0,
                                            lineWidth: 3.0,
                                            percent: state.details.voteAverage!
                                                    .toDouble() /
                                                10,
                                            center: Text(
                                              converUserScore(
                                                  state.details.voteAverage!),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
                                            progressColor: Colors.green,
                                          ),
                                          const SizedBox(width: 10.0),
                                          Text('User Score',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      height: 20.0,
                                      color: Colors.grey,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          _launchUrl(bloc.trailerUrl());
                                        },
                                        child: Row(
                                          children: [
                                            const Spacer(),
                                            const Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text('Play Trailer',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color: Colors.white)),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.black54,
                                width: 100.w,
                                height: 10.h,
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                            text: state.details.releaseDate!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    color: Colors.white,
                                                    fontSize: 12.sp),
                                            children: [
                                              const TextSpan(
                                                  text: '  \u2022  '),
                                              TextSpan(
                                                  text: durationToString(
                                                      state.details.runtime ??
                                                          0)),
                                            ]),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          children: List.generate(
                                            state.details.genres!.length,
                                            (index) => TextSpan(
                                              text: state
                                                  .details.genres![index].name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  ?.copyWith(
                                                      fontSize: 12.sp,
                                                      color: Colors.white),
                                              children: [
                                                index !=
                                                        state.details.genres!
                                                                .length -
                                                            1
                                                    ? const TextSpan(text: ', ')
                                                    : const TextSpan(text: '')
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  state.details.tagline!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Overview',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0, bottom: 16.0),
                                child: Text(
                                  state.details.overview!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Top Billed Cast',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Expanded(
                                  child: SizedBox(
                                height: 40.h,
                                child: CupertinoScrollbar(
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      cacheExtent: 1000,
                                      itemBuilder: (context, index) {
                                        final list =
                                            state.details.credits?.cast;
                                        return CastCard(
                                          key: ValueKey(list?[index].id!),
                                          url:
                                              "${bloc.imageBaseUrl}${list?[index].profilePath}",
                                          name: list?[index].name ?? '',
                                          isFirst: index == 0,
                                          isLast: index == list!.length - 1,
                                          movieName:
                                              list[index].character ?? '',
                                        );
                                      }),
                                ),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 36.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Recommendations',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                ),
                              ),
                              Expanded(
                                  child: SizedBox(
                                height: 20.h,
                                child: CupertinoScrollbar(
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.details.recommendations
                                          ?.results?.length,
                                      cacheExtent: 1000,
                                      itemBuilder: (context, index) {
                                        final list = state
                                            .details.recommendations?.results;
                                        return RecommendationsCard(
                                          key: ValueKey(list?[index].id!),
                                          url:
                                              "${bloc.imageBaseUrl}${list?[index].posterPath}",
                                          name: list?[index].title ?? '',
                                          isFirst: index == 0,
                                          isLast: index == list!.length - 1,
                                          userScore: converUserScore(
                                              list[index].voteAverage ?? 0.0),
                                        );
                                      }),
                                ),
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is MovieDetailsLoading) {
              return SizedBox(
                height: 100.h,
                width: 100.w,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else {
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
                            bloc.add(
                                MovieDetailsEvent(movieId: widget.movieId));
                          },
                          icon: const Icon(Icons.refresh))
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
