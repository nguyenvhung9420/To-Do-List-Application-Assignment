import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app_assignment/database/persistent_database.dart';
import 'package:to_do_list_app_assignment/controllers/todolist_repository.dart';
import 'package:to_do_list_app_assignment/views/home_view.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ToDoListRepository()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: initDatabase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MyHomePage();
          } else {
            return Material(
                child: Center(
              child: CircularProgressIndicator(),
            ));
          }
        },
      ),
    );
  }
}
