import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/book_controller.dart';

class BookDetailScreen extends StatelessWidget {
  final BookController bookController = Get.put(BookController());
  final arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title'] ?? 'Book Detail'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 5.0, // Add elevation for a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      arguments['title'] ?? '',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      arguments['subtitle'] ?? '',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Author: ${arguments['author'] ?? ''}',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Publisher: ${arguments['publisher'] ?? ''}',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Pages: ${arguments['pages'] ?? ''}',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      arguments['description'] ?? '',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Website:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {
                        // Handle website click
                      },
                      child: Text(
                        arguments['website'] ?? '',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
