part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object?> get props => [];
}


class PersonInitial extends PersonState {
  @override
  List<Object?> get props => [];
}


class PersonDatabaseLoaded extends PersonState {
  final Box box;

  const PersonDatabaseLoaded(this.box);

  @override
  List<Object?> get props => [box];
}


class PersonDatabaseFailure extends PersonState {
  @override
  List<Object?> get props => [];
}