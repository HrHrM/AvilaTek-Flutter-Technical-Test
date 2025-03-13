part of 'actor_bloc.dart';

abstract class ActorState extends Equatable {
  @override
  List<Object> get props => [];
}

class ActorLoading extends ActorState {}

class ActorLoaded extends ActorState {
  final Actor actor;

  ActorLoaded(this.actor);

  @override
  List<Object> get props => [actor];
}

class ActorError extends ActorState {}
