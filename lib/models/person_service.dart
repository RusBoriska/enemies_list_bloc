import 'package:hive_flutter/hive_flutter.dart';

import '/models/person.dart';


class PersonService {
  final String boxName = 'peopleBox';
  late final Box box = Hive.box(boxName);


  // Initialization
  Future<void> init() async {
    // Registering the adapter
    Hive.registerAdapter(PersonAdapter());
    // Opening the box
    await Hive.openBox(boxName);
  }


  // Add
  addInfo(Person newPerson) async {
    box.add(newPerson);
    print('Info added to box!');
  }


  // Update
  updateInfo(index, newPerson) {
    box.putAt(index, newPerson);
    print('Info updated in box!');
  }


  // Delete
  deleteInfo(int index) {
    box.deleteAt(index);
    print('Item deleted from box at index: $index');
  }


}