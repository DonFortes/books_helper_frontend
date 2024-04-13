// Dart imports:
// Flutter imports:
import 'package:books_library/api.dart';
import 'package:flutter/foundation.dart';

// Package imports:

import '../repostories/book_repository.dart';

class BookProvider with ChangeNotifier, DiagnosticableTreeMixin {
  BookProvider();

  final BooksRepository bookRepository = BooksRepository();

  bool isLoading = false;

  Future<PaginatedBookList?> get books async {
    return bookRepository.listBooks();
  }

  Future<Book?> createBook(BookRequest bookRequest) async {
    Book? response = await bookRepository.createBook(bookRequest);
    notifyListeners();
    return response;
  }

  Future<Book?> updateBook(int id, BookRequest bookRequest) async {
    Book? response = await bookRepository.updateBook(id, bookRequest);
    notifyListeners();
    return response;
  }

  Future<void> deleteBook(int id) async {
    await bookRepository.deleteBook(id);
    notifyListeners();
  }

// Future<List> listBooks() async {
//   isLoading = true;
//   String? scheduledMessagesResponse = await bookRepository.listBooks();
//   final scheduledMessages = json.decode(scheduledMessagesResponse!);
//   isLoading = false;
//   return scheduledMessages;
// }

//
// Future<void> deleteScheduledBatchMessages(String jobId) async {
//   await bookRepository.deleteScheduledBatchMessages(jobId);
//   notifyListeners();
// }
//
// Future<List<ResponseBatchPushStats>?> getBatchStats() async {
//   isLoading = true;
//   List<ResponseBatchPushStats>? batchResults = await bookRepository.getBatchStats();
//   isLoading = false;
//   return batchResults;
// }
//
// Future<List<String?>?> getBatchErrors(String sendingId) async {
//   isLoading = true;
//   List<ResponseBatchPushErrors>? batchResults = await bookRepository.getBatchErrors(sendingId);
//   isLoading = false;
//   List<String?>? batchErrors =
//       batchResults?.map((ResponseBatchPushErrors batchResult) => batchResult.errorMessage).toList();
//   return batchErrors;
// }
}
