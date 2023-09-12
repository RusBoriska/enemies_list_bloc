import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../bloc/person_bloc.dart';
import '/models/person.dart';


class UpdatePersonForm extends StatelessWidget {
  UpdatePersonForm({Key? key, required this.index, required this.person}) : super(key: key);

  final int index;
  final Person person;


  final _personFormKey = GlobalKey<FormState>();

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {

    final _nameController = TextEditingController(text: person.name);
    final _surnameController = TextEditingController(text: person.surname);
    final _howController = TextEditingController(text: person.how);
    final _whenController = TextEditingController(text: person.when);
    final _revengeController = TextEditingController(text: person.revenge);

    return Form(
      key: _personFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name'),
            TextFormField(
              controller: _nameController,
              validator: _fieldValidator,
            ),
            const SizedBox(height: 24.0),
            const Text('Surname'),
            TextFormField(
              controller: _surnameController,
              validator: _fieldValidator,
            ),
            const SizedBox(height: 24.0),
            const Text('How he/she offended me'),
            TextFormField(
              controller: _howController,
              validator: _fieldValidator,
            ),
            const SizedBox(height: 24.0),
            const Text('When he/she offended me'),
            TextFormField(
              controller: _whenController,
              validator: _fieldValidator,
            ),
            const SizedBox(height: 24.0),
            const Text('My revenge on him/her'),
            TextFormField(
              controller: _revengeController,
              validator: _fieldValidator,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 24.0),
              child: Container(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_personFormKey.currentState!.validate()) {
                        Person newPerson = Person(
                            name: _nameController.text,
                            surname: _surnameController.text,
                            how: _howController.text,
                            when: _whenController.text,
                            revenge: _revengeController.text
                        );
                        context.read<PersonBloc>().add(PersonUpdated(index, newPerson));

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Update'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
