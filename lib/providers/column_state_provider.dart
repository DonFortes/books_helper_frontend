// Dart imports:

// Flutter imports:
import 'package:flutter/foundation.dart';

class ColumnsStateProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _name = true;
  bool _title = true;
  bool _author = true;
  bool _description = true;
  bool _price = true;

  bool get bookNameIsVisible {
    return _name;
  }

  bool get bookTitleIsVisible {
    return _title;
  }

  bool get bookAuthorIsVisible {
    return _author;
  }

  bool get bookDescriptionIsVisible {
    return _description;
  }

  bool get bookPriceIsVisible {
    return _price;
  }

  void setNameVisibility(bool isVisible) {
    _name = isVisible;
    notifyListeners();
  }

  void setTitleVisibility(bool isVisible) {
    _title = isVisible;
    notifyListeners();
  }

  void setAuthorVisibility(bool isVisible) {
    _author = isVisible;
    notifyListeners();
  }

  void setDescriptionVisibility(bool isVisible) {
    _description = isVisible;
    notifyListeners();
  }

  void setPriceVisibility(bool isVisible) {
    _price = isVisible;
    notifyListeners();
  }

  void setAllColumnsVisible() {
    _name = true;
    _title = true;
    _author = true;
    _description = true;
    _price = true;
  }

  bool allColumnsUnchecked() {
    return _name == false && _title == false && _author == false && _description == false && _price == false;
  }
}
