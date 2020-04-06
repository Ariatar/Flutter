import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restapi/services/picture-service.dart';
import 'package:restapi/views/album-list.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => PictureServices());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlbumList(),
    );
  }
}
