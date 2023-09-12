import 'package:flutter/material.dart';
import '/utils/add_person_form.dart';


class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddPersonForm(),
      ),
    );
  }
}
