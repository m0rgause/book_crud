import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
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
    print("token: $token");
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
      print("response: $response");
      bookList.value = response.data['data'];
    } catch (e) {
      print(e);
    }
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
