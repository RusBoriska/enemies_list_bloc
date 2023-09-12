part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}


class PersonDatabaseFetched extends PersonEvent {
  @override
  List<Object> get props => [];
}


class PersonAdded extends PersonEvent {
  final Person newPerson;
  const PersonAdded(this.newPerson);
  @override
  List<Object> get props => [newPerson];
}


class PersonUpdated extends PersonEvent {
  final int index;
  final Person newPerson;
  const PersonUpdated(this.index, this.newPerson);
  @override
  List<Object> get props => [index, newPerson];
}


class PersonDeleted extends PersonEvent {
  final int index;
  const PersonDeleted(this.index);
  @override
  List<Object> get props => [index];
}