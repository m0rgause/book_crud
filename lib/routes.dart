// routes.dart
import 'package:get/get.dart';
import 'package:basic_books/screens/login.dart';
import 'package:basic_books/screens/registration.dart';
import 'package:basic_books/screens/home.dart';

class RoutesApp {
  static final initial = '/home';
  static final home = '/home';
  static final login = '/login';
  static final registration = '/registration';

  static final routes = [
    GetPage(name: initial, page: () => HomeScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: registration, page: () => RegistrationScreen()),
  ];
}
