import 'package:basic_books/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:basic_books/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Basic Books',
      initialRoute: RoutesApp.login,
      getPages: RoutesApp.routes,
    );
  }
}
