part of 'actor_bloc.dart';

abstract class ActorEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadActorDetails extends ActorEvent {
  final int actorID;

  LoadActorDetails(this.actorID);

  @override
  List<Object> get props => [actorID];
}
