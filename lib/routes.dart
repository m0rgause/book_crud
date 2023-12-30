// routes.dart
import 'package:get/get.dart';
import 'package:basic_books/screens/login.dart';
import 'package:basic_books/screens/registration.dart';
import 'package:basic_books/screens/home.dart';

class RoutesApp {
  static final initial = '/login';
  static final login = '/login';
  static final registration = '/registration';

  static final routes = [
    GetPage(name: initial, page: () => LoginScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: registration, page: () => RegistrationScreen()),
  ];
}
