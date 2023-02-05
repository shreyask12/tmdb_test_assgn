import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_movie_assigment/presentation/movies_home/widgets/image_render.dart';

class RecommendationsCard extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final String url;
  final String name;
  final String userScore;

  const RecommendationsCard({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.url,
    required this.name,
    required this.userScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: isFirst ? 16 : 8,
        right: isLast ? 16 : 8,
      ),
      width: 60.w,
      height: 20.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 60.w, height: 20.h, child: ImageRender(url: url)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 8, right: 2),
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(),
                    maxLines: 2,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "$userScore %",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 9.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
