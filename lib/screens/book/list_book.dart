import 'package:basic_books/controllers/book_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controllers/book_controller.dart';

class ListBook extends StatelessWidget {
  // const ListBook({Key? key}) : super(key: key);
  final BookController bookController = Get.put(BookController());
  // wait until the controller is initialized

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          GetBuilder<BookController>(
            builder: (controller) {
              return Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: controller.bookList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.bookList[index]['title'] ?? '',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "${controller.bookList[index]['author'] ?? ''} - ${controller.bookList[index]['pages'] ?? ''} pages",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // detail, edit, delete
                            IconButton(
                              onPressed: () {
                                controller.getBookDetail(
                                    controller.bookList[index]['id']);
                              },
                              icon: Icon(
                                Icons.info,
                                color: Colors.lightBlue,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed('/book/edit',
                                    arguments: controller.bookList[index]);
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // confirm delete
                                Get.defaultDialog(
                                  title: 'Delete Book',
                                  middleText:
                                      'Are you sure want to delete this book?',
                                  textConfirm: 'Delete',
                                  onConfirm: () {
                                    controller.deleteBook(
                                        controller.bookList[index]['id']);
                                    Get.back();
                                  },
                                  onCancel: () {},
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Get.toNamed('/book/add');
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
      // btn tambah buku, floating action button on bottom right
    ));
  }
}
