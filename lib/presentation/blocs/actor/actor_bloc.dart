import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_avilatek/data/repos/movie_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_avilatek/data/models/actor.dart';

part 'actor_event.dart';
part 'actor_state.dart';

class ActorBloc extends Bloc<ActorEvent, ActorState> {
  final MovieRepository movieRepository;

  ActorBloc(this.movieRepository) : super(ActorLoading()) {
    on<LoadActorDetails>(_onLoadActorDetails);
  }

  void _onLoadActorDetails(
    LoadActorDetails event,
    Emitter<ActorState> emit,
  ) async {
    try {
      final actor = await movieRepository.fetchActorDetails(event.actorID);
      emit(ActorLoaded(actor));
    } catch (_) {
      emit(ActorError());
    }
  }
}
