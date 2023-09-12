import 'package:flutter/material.dart';

import '/models/person.dart';
import '/utils/update_person_form.dart';


class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key, required this.index, required this.person}) : super(key: key);

  final int index;
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Update Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UpdatePersonForm(
          index: index,
          person: person,
        ),
      ),
    );
  }
}
