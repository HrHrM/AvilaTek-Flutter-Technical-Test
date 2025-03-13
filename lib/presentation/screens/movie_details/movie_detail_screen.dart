import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_avilatek/core/network/api_client.dart';
import 'package:flutter_test_avilatek/core/utils/constants.dart';
import 'package:flutter_test_avilatek/data/models/movie.dart';
import 'package:flutter_test_avilatek/data/repos/movie_repo.dart';
import 'package:flutter_test_avilatek/presentation/blocs/actor/actor_bloc.dart';
import 'package:flutter_test_avilatek/presentation/blocs/movie_details/movie_detail_bloc.dart';
import 'package:flutter_test_avilatek/presentation/screens/actor_details/actor_details_screen.dart';
import 'package:flutter_test_avilatek/presentation/widgets/actor_card.dart';
import 'package:flutter_test_avilatek/presentation/widgets/custom_loader.dart';
import 'package:flutter_test_avilatek/presentation/widgets/error_text.dart';
import 'package:flutter_test_avilatek/theme/theme.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailBloc>().add(LoadMovieDetail(widget.movie));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(child: CustomLoader());
          } else if (state is MovieDetailLoaded) {
            return FadeIn(
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "${ApiConstants.imageBaseURL}${state.movie.posterPath}",
                    placeholder:
                        (context, url) => const Center(child: CustomLoader()),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: FadeInUp(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(0, 0, 0, 0.1),
                              Color.fromRGBO(0, 0, 0, 0.6),
                              Color.fromRGBO(0, 0, 0, 0.9),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.zero,
                        elevation: 5,
                        minimumSize: const Size(40, 40),
                        backgroundColor: Colors.transparent,
                      ),
                      child: Ink(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppTheme.primaryGradient,
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.black38,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: FadeInUp(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.movie.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontFamily: 'Baloo-Regular',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${(state.movie.voteAverage * 10).toStringAsFixed(0)}% User Score",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Baloo-Regular',
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 140,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.actors.length,
                                itemBuilder: (context, index) {
                                  final actor = state.actors[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) => BlocProvider(
                                                create:
                                                    (_) => ActorBloc(
                                                      MovieRepository(
                                                        ApiClient(),
                                                      ),
                                                    ),
                                                child: ActorDetailsPage(
                                                  actorID: actor.id,
                                                ),
                                              ),
                                        ),
                                      );
                                    },
                                    child: ActorCard(actor: actor),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ErrorText(message: 'Error Loading Details');
          }
        },
      ),
    );
  }
}
