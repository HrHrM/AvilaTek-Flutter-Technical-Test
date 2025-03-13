import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_avilatek/core/utils/constants.dart';
import 'package:flutter_test_avilatek/presentation/widgets/custom_loader.dart';

class MovieCard extends StatelessWidget {
  final Map<String, dynamic> movie;
  final int index;

  const MovieCard({super.key, required this.movie, required this.index});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CachedNetworkImage(
              imageUrl: "${ApiConstants.imageBaseURL}${movie['poster_path']}",
              placeholder: (context, url) => const CustomLoader(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: double.infinity,
              height: index.isEven ? 250 : 280,
              fit: BoxFit.cover,
            ),
            Container(
              height: index.isEven ? 250 : 280,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color.fromRGBO(0, 0, 0, 0.7)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie['title'] ?? 'Unknown',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Baloo-Regular',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${(movie['vote_average'] * 10).toStringAsFixed(0)}% User Score",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontFamily: 'Baloo-Regular',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
