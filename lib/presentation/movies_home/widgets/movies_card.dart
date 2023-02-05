import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_movie_assigment/presentation/movies_home/widgets/image_render.dart';

class MoviesCard extends StatelessWidget {
  final int id;
  final bool isFirst;
  final bool isLast;
  final String url;
  final String title;
  final String releaseDate;
  final num userScore;
  final VoidCallback onTap;

  const MoviesCard({
    Key? key,
    required this.id,
    required this.isFirst,
    required this.isLast,
    required this.url,
    required this.title,
    required this.releaseDate,
    required this.userScore,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: isFirst ? 16 : 8,
          right: isLast ? 16 : 8,
        ),
        width: 40.w,
        height: 30.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 35.w, height: 25.h, child: ImageRender(url: url)),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 8, right: 2),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11.0.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Text(
                releaseDate,
                style: TextStyle(
                    fontSize: 9.0.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
