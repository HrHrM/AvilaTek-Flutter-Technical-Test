import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_avilatek/core/utils/constants.dart';
import 'package:flutter_test_avilatek/presentation/blocs/actor/actor_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test_avilatek/presentation/widgets/custom_loader.dart';
import 'package:flutter_test_avilatek/presentation/widgets/error_text.dart';
import 'package:flutter_test_avilatek/presentation/widgets/movie_card.dart';
import 'package:flutter_test_avilatek/theme/theme.dart';

class ActorDetailsPage extends StatefulWidget {
  final int actorID;

  const ActorDetailsPage({super.key, required this.actorID});

  @override
  State<ActorDetailsPage> createState() => _ActorDetailsPageState();
}

class _ActorDetailsPageState extends State<ActorDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ActorBloc>().add(LoadActorDetails(widget.actorID));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ActorBloc, ActorState>(
        builder: (context, state) {
          if (state is ActorLoading) {
            return const Center(child: CustomLoader());
          } else if (state is ActorLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.zero,
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
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  FadeInRight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              state.actor.profilePath != null
                                  ? NetworkImage(
                                    "${ApiConstants.imageBaseURL}${state.actor.profilePath}",
                                  )
                                  : null,
                          backgroundColor: Colors.grey[300],
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.actor.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Baloo-Regular',
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.actor.biography ??
                                    "No biography available.",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontFamily: 'Baloo2-Regular',
                                ),
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInLeft(
                    child: const Text(
                      "Casted on",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Baloo-Regular',
                      ),
                    ),
                  ),
                  MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 30,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.actor.knownFor?.length ?? 0,
                    itemBuilder: (context, index) {
                      final movie = state.actor.knownFor![index];
                      return MovieCard(movie: movie, index: index);
                    },
                  ),
                ],
              ),
            );
          } else {
            return ErrorText(message: 'Error Loading Actor Details');
          }
        },
      ),
    );
  }
}
