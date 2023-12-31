import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/book_controller.dart';

class BookEditScreen extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);
  final arguments = Get.arguments;
  final BookController bookController = Get.put(BookController());
  TextEditingController isbnController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController publishedController = TextEditingController();
  TextEditingController publisherController = TextEditingController();
  TextEditingController pagesController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  // select date picker without time
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // current date
      firstDate: DateTime(1900), // start date
      lastDate: DateTime(2100), // end date
    );
    if (picked != null) {
      publishedController.text = picked.toString().substring(0, 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    isbnController.text = arguments['isbn'] ?? '';
    titleController.text = arguments['title'] ?? '';
    subtitleController.text = arguments['subtitle'] ?? '';
    authorController.text = arguments['author'] ?? '';
    publishedController.text = arguments['published'] ?? '';
    publisherController.text = arguments['publisher'] ?? '';
    pagesController.text = '${arguments['pages'] ?? ''}';
    descriptionController.text = arguments['description'] ?? '';
    websiteController.text = arguments['website'] ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Book')),
      // form add book, isbn, title, subtitle, author, published, publisher, pages, description, website
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          child: ListView(
            children: [
              // isbn
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ISBN',
                  border: OutlineInputBorder(),
                ),
                controller: isbnController,
              ),
              SizedBox(
                height: 20.0,
              ),
              // title
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                controller: titleController,
              ),
              SizedBox(
                height: 20.0,
              ),
              // subtitle
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Subtitle',
                  border: OutlineInputBorder(),
                ),
                controller: subtitleController,
              ),
              SizedBox(
                height: 20.0,
              ),
              // author
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Author',
                  border: OutlineInputBorder(),
                ),
                controller: authorController,
              ),
              SizedBox(
                height: 20.0,
              ),
              // published date
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Published',
                  border: OutlineInputBorder(),
                ),
                controller: publishedController,
                onTap: () {
                  _selectDate(context);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              // publisher
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Publisher',
                  border: OutlineInputBorder(),
                ),
                controller: publisherController,
              ),
              SizedBox(
                height: 20.0,
              ),
              // pages
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Pages',
                  border: OutlineInputBorder(),
                ),
                controller: pagesController,
              ),
              SizedBox(
                height: 20.0,
              ),
              // description
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                controller: descriptionController,
              ),
              SizedBox(
                height: 20.0,
              ),
              // website
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Website',
                  border: OutlineInputBorder(),
                ),
                controller: websiteController,
              ),
              SizedBox(
                height: 20.0,
              ),
              // button save
              ElevatedButton(
                onPressed: () {
                  bookController.updateBook(arguments['id'], {
                    'isbn': isbnController.text,
                    'title': titleController.text,
                    'subtitle': subtitleController.text,
                    'author': authorController.text,
                    'published': publishedController.text,
                    'publisher': publisherController.text,
                    'pages': pagesController.text,
                    'description': descriptionController.text,
                    'website': websiteController.text,
                  });
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
