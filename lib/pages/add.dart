import 'package:flutter/material.dart';
import '../services/addservice.dart';
import '../models/bookmodel.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Book Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the book name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the author name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Create a new book and save it to Firestore
                    BookModel book = BookModel(
                      name: _nameController.text,
                      author: _authorController.text,
                    );
                    await AddService.addBook(book);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Book added successfully')),
                    );
                    Navigator.pop(context); // Go back to the previous page
                  }
                },
                child: Text('Add Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
