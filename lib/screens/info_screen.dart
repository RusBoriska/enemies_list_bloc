import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/bloc/person_bloc.dart';
import '/screens/update_screen.dart';
import '/screens/add_screen.dart';


class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonBloc, PersonState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is PersonDatabaseFailure) {
          return const Center(
            child: Text('Error!'),
          );
        }
        if (state is PersonDatabaseLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('People Info'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () =>
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddScreen(),
                    ),
                  ),
              child: const Icon(Icons.add),
            ),
            body: ValueListenableBuilder(
              valueListenable: state.box.listenable(),
              builder: (context, Box box, widget) {
                if (box.isEmpty) {
                  return const Center(
                    child: Text('Empty'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      var currentBox = box;
                      var personData = currentBox.getAt(index)!;

                      return InkWell(
                        onTap: () =>
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdateScreen(
                                      index: index,
                                      person: personData,
                                    ),
                              ),
                            ),
                        child: ListTile(
                          title: Text(
                              '${personData.name} ${personData.surname}'),
                          subtitle: Text(personData.how),
                          trailing: IconButton(
                            onPressed: () =>
                            context.read<PersonBloc>().add(PersonDeleted(index)),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          );
        };
         return const CircularProgressIndicator();
      },
    );
  }
}
