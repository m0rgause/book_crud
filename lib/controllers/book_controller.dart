import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class BookController extends GetxController {
  final Dio _dio = Dio();
  final token = GetStorage().read('token');
  final bookList = [].obs;
  var tabIndex = 0;

  @override
  void onInit() {
    super.onInit();
    if (token == null) {
      Future.delayed(Duration.zero, () {
        Get.offAllNamed('/login');
      });
    }
    // get book list when controller init or app start
    getBookList();
  }

  void getBookList() async {
    try {
      final response = await _dio.get(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
        ),
      );
      // bookList.value = response.data['data'];
      // print(bookList);
      bookList.assignAll(response.data['data']);
    } catch (e) {
      print(e);
    }
  }

  void addBook(Map<String, dynamic> data) async {
    // validate data
    if (data['title'] == null || data['title'] == '') {
      Get.snackbar('Error', 'Title is required');
      return;
    }
    if (data['author'] == null || data['author'] == '') {
      Get.snackbar('Error', 'Author is required');
      return;
    }
    if (data['pages'] == null || data['pages'] == '') {
      Get.snackbar('Error', 'Pages is required');
      return;
    }
    if (data['description'] == null || data['description'] == '') {
      Get.snackbar('Error', 'Description is required');
      return;
    }
    if (data['website'] == null || data['website'] == '') {
      Get.snackbar('Error', 'Website is required');
      return;
    }

    try {
      print(data);
      final response = await _dio.post(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/add',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
        ),
      );
      print(response.data);
      getBookList();
      Get.back();
    } catch (e) {
      if (e is DioError) {
        print(e.response);
        Get.snackbar('Error', e.response!.data['message']);
      }
    }
  }

  // detail book
  void getBookDetail(int id) async {
    try {
      final response = await _dio.get(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
        ),
      );
      // print(response.data);
      Get.toNamed('/book/detail', arguments: response.data);
    } catch (e) {
      print(e);
    }
  }

  // update book
  void updateBook(int id, Map<String, dynamic> data) async {
    // validate data
    if (data['title'] == null || data['title'] == '') {
      Get.snackbar('Error', 'Title is required');
      return;
    }
    if (data['author'] == null || data['author'] == '') {
      Get.snackbar('Error', 'Author is required');
      return;
    }
    if (data['pages'] == null || data['pages'] == '') {
      Get.snackbar('Error', 'Pages is required');
      return;
    }
    if (data['description'] == null || data['description'] == '') {
      Get.snackbar('Error', 'Description is required');
      return;
    }
    if (data['website'] == null || data['website'] == '') {
      Get.snackbar('Error', 'Website is required');
      return;
    }

    try {
      final response = await _dio.put(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$id/edit',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
        ),
      );
      print(response.data);
      getBookList();
      Get.back();
    } catch (e) {
      if (e is DioError) {
        print(e.response);
        Get.snackbar('Error', e.response!.data['message']);
      }
    }
  }

  void deleteBook(int id) async {
    try {
      final response = await _dio.delete(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
        ),
      );
      print(response.data);
      getBookList();
    } catch (e) {
      if (e is DioError) {
        print(e.response);
        Get.snackbar('Error', e.response!.data['message']);
      }
    }
  }
}
