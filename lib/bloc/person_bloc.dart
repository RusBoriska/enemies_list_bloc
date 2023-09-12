import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

import '/models/person.dart';
import '/models/person_service.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonService _personService;
  late final box = _personService.box;

  PersonBloc(this._personService) : super(PersonInitial()) {
    on<PersonDatabaseFetched>((event, emit) {
      emit(PersonDatabaseLoaded(box));
    });

    on<PersonAdded>((event, emit) {
      _personService.addInfo(event.newPerson);
      emit(PersonDatabaseLoaded(box));
    });

    on<PersonUpdated>((event, emit) {
      _personService.updateInfo(event.index, event.newPerson);
      emit(PersonDatabaseLoaded(box));
    });

    on<PersonDeleted>((event, emit) {
      _personService.deleteInfo(event.index);
      emit(PersonDatabaseLoaded(box));
    });
  }
}



