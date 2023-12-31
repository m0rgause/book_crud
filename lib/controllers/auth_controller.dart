// auth_controller.dart
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

class AuthController extends GetxController {
  final Dio _dio = Dio();

  Future<void> login(String email, String password) async {
    // send post request to login endpoint with email and password with dio https://book-crud-service-6dmqxfovfq-et.a.run.app/api/login

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    // validasi data
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
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

    var data = json.encode({"email": email, "password": password});

    try {
      var response = await _dio.request(
          'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/login',
          data: data,
          options: Options(headers: headers, method: 'POST'));

      // print(response);

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Login success',
          snackPosition: SnackPosition.BOTTOM,
        );
        // get token from response and save to local storage
        // print(response);
        var token = response.data['token'];
        await GetStorage().write('token', token).then((value) {
          print('token saved');
          GetStorage().write('isLogin', true);
          Get.offNamed('/home');
        }).catchError((e) {
          print(e);
        });

        // print(await GetStorage().read('token'));
        // redirect to home page
        // Get.toNamed('/home');
      } else {
        Get.snackbar(
          'Error',
          'Login failed',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      if (e is DioError) {
        Get.snackbar(
          'Login Failed!',
          e.response?.data['message'],
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Login Failed!',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

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

      // print(response);

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
      } else {
        Get.snackbar(
          'Register Failed!',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void logout() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${GetStorage().read('token')}'
      };
      var res = await _dio.delete(
          'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/user/logout',
          options: Options(headers: headers)
          // options: Options(headers: headers, method: 'POST')
          );

      GetStorage().remove('token');
      GetStorage().remove('isLogin');

      if (res.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Logout success',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'Logout failed',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      Get.offAllNamed('/login');
    } catch (e) {
      if (e is DioError) {
        Get.snackbar(
          'Logout Failed!',
          e.response?.data['message'],
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Logout Failed!',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
