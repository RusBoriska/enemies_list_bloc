import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/models/person.dart';
import '/bloc/app_bloc_observer.dart';
import 'bloc/person_bloc.dart';
import 'screens/info_screen.dart';
import '/models/person_service.dart';

main() async {
  // Initialize hive
  await Hive.initFlutter();

  final PersonService personService = PersonService();
  await personService.init();

  Bloc.observer = AppBlocObserver();
  runApp(
      BlocProvider(
        create: (context) => PersonBloc(PersonService())..add(PersonDatabaseFetched()),
        child: MyApp(),
      ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enemies List',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: InfoScreen(),
    );
  }
}
