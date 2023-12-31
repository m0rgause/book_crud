import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final token = GetStorage().read('token');
  var tabIndex = 0;

  @override
  void onInit() {
    super.onInit();
    if (token == null) {
      Future.delayed(Duration.zero, () {
        // print('token null');
        Get.offAllNamed('/login');
      });
    }
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
