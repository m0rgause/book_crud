import 'package:basic_books/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:basic_books/routes.dart';

void main() {
  GetStorage.init();
  // hide debug banner

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Books',
      initialRoute: RoutesApp.initial,
      getPages: RoutesApp.routes,
    );
  }
}
