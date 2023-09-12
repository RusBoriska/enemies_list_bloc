import 'package:enemies_list_bloc/bloc/person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '/models/person.dart';


class AddPersonForm extends StatelessWidget {
  AddPersonForm({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _howController = TextEditingController();
  final _whenController = TextEditingController();
  final _revengeController = TextEditingController();
  final _personFormKey = GlobalKey<FormState>();

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
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
                      context.read<PersonBloc>().add(PersonAdded(newPerson));
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Add'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
