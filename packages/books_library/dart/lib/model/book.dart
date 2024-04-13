//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Book {
  /// Returns a new [Book] instance.
  Book({
    required this.id,
    required this.name,
    this.title,
    required this.author,
    this.description,
    required this.price,
  });

  int id;

  String name;

  String? title;

  String author;

  String? description;

  /// Minimum value: 0
  /// Maximum value: 99999
  int price;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Book &&
    other.id == id &&
    other.name == name &&
    other.title == title &&
    other.author == author &&
    other.description == description &&
    other.price == price;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (author.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (price.hashCode);

  @override
  String toString() => 'Book[id=$id, name=$name, title=$title, author=$author, description=$description, price=$price]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'name'] = this.name;
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
      json[r'author'] = this.author;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'price'] = this.price;
    return json;
  }

  /// Returns a new [Book] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Book? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Book[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Book[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Book(
        id: mapValueOfType<int>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        title: mapValueOfType<String>(json, r'title'),
        author: mapValueOfType<String>(json, r'author')!,
        description: mapValueOfType<String>(json, r'description'),
        price: mapValueOfType<int>(json, r'price')!,
      );
    }
    return null;
  }

  static List<Book> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Book>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Book.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Book> mapFromJson(dynamic json) {
    final map = <String, Book>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Book.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Book-objects as value to a dart map
  static Map<String, List<Book>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Book>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Book.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'author',
    'price',
  };
}

