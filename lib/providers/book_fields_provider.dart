// Dart imports:

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class BookFieldsProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String method = 'POST';
  late int bookId;
  late final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _bookTitleController = TextEditingController();
  final TextEditingController _bookAuthorController = TextEditingController();
  final TextEditingController _bookDescriptionController = TextEditingController();
  final TextEditingController _bookPriceController = TextEditingController();

  void resetProvider() {
    method = 'POST';
    _bookNameController.text = '';
    _bookTitleController.text = '';
    _bookAuthorController.text = '';
    _bookDescriptionController.text = '';
    _bookPriceController.text = '';
    notifyListeners();
  }

  get bookNameController {
    return _bookNameController;
  }

  get bookTitleController {
    return _bookTitleController;
  }

  get bookAuthorController {
    return _bookAuthorController;
  }

  get bookDescriptionController {
    return _bookDescriptionController;
  }

  get bookPriceController {
    return _bookPriceController;
  }

  void setBookName(String value) {
    _bookNameController.text = value;
    notifyListeners();
  }

  void setBookTitle(String value) {
    _bookTitleController.text = value;
    notifyListeners();
  }

  void setBookAuthor(String value) {
    _bookAuthorController.text = value;
    notifyListeners();
  }

  void setBookDescription(String value) {
    _bookDescriptionController.text = value;
    notifyListeners();
  }

  void setBookPrice(String value) {
    _bookPriceController.text = value;
    notifyListeners();
  }
}
