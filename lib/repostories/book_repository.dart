// Package imports:

import 'package:books_library/api.dart';

import '../config.dart';
import '../providers/auth_provider.dart';

class BooksRepository {
  Future<BookApi> getBookApi(Authentication authentication) async {
    return BookApi(ApiClient(basePath: backendHost, authentication: authentication));
  }

  Future<Book?> createBook(BookRequest bookRequest) async {
    BookApi bookApi = await getBookApi(basicAuthRepository);
    Book? response = await bookApi.bookCreate(bookRequest);
    return response;
  }

  Future<Book?> updateBook(int id, BookRequest bookRequest) async {
    BookApi bookApi = await getBookApi(basicAuthRepository);
    Book? response = await bookApi.bookUpdate(id, bookRequest);
    return response;
  }

  Future<PaginatedBookList?> listBooks() async {
    BookApi bookApi = await getBookApi(basicAuthRepository);
    return await bookApi.bookList();
  }

  Future<void> deleteBook(int id) async {
    BookApi bookApi = await getBookApi(basicAuthRepository);
    return await bookApi.bookDestroy(id);
  }
}
