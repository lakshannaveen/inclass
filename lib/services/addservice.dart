import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/bookmodel.dart';

class AddService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a book to Firestore
  static Future<void> addBook(BookModel book) async {
    try {
      await _firestore.collection('books').add({
        'name': book.name,
        'author': book.author,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error adding book: $e');
    }
  }

  // Retrieve books from Firestore (optional)
  static Stream<List<BookModel>> getBooks() {
    return _firestore.collection('books').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return BookModel(
          name: doc['name'],
          author: doc['author'],
          imagePath: doc['imagePath'], // Add the required imagePath argument
        );
      }).toList();
    });
  }
}
