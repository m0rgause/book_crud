// routes.dart
import 'package:get/get.dart';
import 'package:basic_books/screens/login.dart';
import 'package:basic_books/screens/registration.dart';
import 'package:basic_books/screens/home.dart';
import 'package:basic_books/screens/book/add_book.dart';
import 'package:basic_books/screens/book/edit_book.dart';
import 'package:basic_books/screens/book/detail_book.dart';

class RoutesApp {
  static final initial = '/home';
  static final home = '/home';
  static final login = '/login';
  static final registration = '/registration';
  static final bookAdd = '/book/add';
  static final bookEdit = '/book/edit';
  static final bookDetail = '/book/detail';

  static final routes = [
    GetPage(name: initial, page: () => HomeScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: registration, page: () => RegistrationScreen()),
    GetPage(name: bookAdd, page: () => BookAddScreen()),
    GetPage(name: bookEdit, page: () => BookEditScreen()),
    GetPage(name: bookDetail, page: () => BookDetailScreen()),
  ];
}
