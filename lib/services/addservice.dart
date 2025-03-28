import '../models/bookmodel.dart';

class AddService {
  static final List<BookModel> _books = [];

  static void addBook(BookModel book) {
    _books.add(book);
    // You can add logic to save the book to a database or API here
  }

  static List<BookModel> getBooks() {
    return _books;
  }
}
