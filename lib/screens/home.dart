// home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/auth_controller.dart';
import 'book/list_book.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'List Book',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  authController.logout();
                },
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                ListBook(),
                Center(
                  child: Text('Profile'),
                ),
                Center(
                  child: Text('Logout'),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.blue,
            currentIndex: controller.tabIndex,
            onTap: (index) {
              controller.changeTabIndex(index);
            },
            // showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              _bottomNavigationBarItem(Icons.book, 'Books'),
              _bottomNavigationBarItem(Icons.person, 'Profile'),
            ],
          ));
    });
  }

  _bottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
