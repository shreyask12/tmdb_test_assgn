import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_movie_assigment/presentation/movies_home/widgets/image_render.dart';

class CastCard extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final String url;
  final String name;
  final String movieName;

  const CastCard({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.url,
    required this.name,
    required this.movieName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: isFirst ? 16 : 8,
        right: isLast ? 16 : 8,
      ),
      width: 25.w,
      height: 40.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 25.w,
            height: 15.h,
            child: ImageRender(url: url),
          ),
          const SizedBox(height: 8),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 8, right: 2),
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11.0.sp,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              child: Text(
                movieName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 9.0.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
