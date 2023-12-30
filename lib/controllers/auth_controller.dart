// auth_controller.dart
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class AuthController extends GetxController {
  final Dio _dio = Dio();

  void login(String username, String password) {}

  void register(String name, String email, String password,
      String passwordConfirmation) async {
    // send post request to register endpoint with name, email, password, and password_confirmation with dio https://book-crud-service-6dmqxfovfq-et.a.run.app/api/register

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    // validasi data
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        passwordConfirmation.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else if (password != passwordConfirmation) {
      Get.snackbar(
        'Error',
        'Password and password confirmation must be same',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else if (password.length < 8) {
      Get.snackbar(
        'Error',
        'Password must be at least 8 characters',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else if (!email.contains('@')) {
      Get.snackbar(
        'Error',
        'Email must be valid',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    var data = json.encode({
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation
    });

    try {
      var response = await _dio.post(
          'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/register',
          data: data,
          options: Options(headers: headers));

      print(response);

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Register success',
          snackPosition: SnackPosition.BOTTOM,
        );
        // redirect to login page
        Get.offNamed('/login');
      } else {
        Get.snackbar(
          'Error',
          'Register failed',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      if (e is DioError) {
        Get.snackbar(
          'Register Failed!',
          e.response?.data['message'],
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void logout() {}
}
