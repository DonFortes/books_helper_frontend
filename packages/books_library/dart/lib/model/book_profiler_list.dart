//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BookProfilerList {
  /// Returns a new [BookProfilerList] instance.
  BookProfilerList({
    this.name = true,
    this.title = true,
    this.author = true,
    this.description = true,
    this.price = true,
  });

  bool name;

  bool title;

  bool author;

  bool description;

  bool price;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BookProfilerList &&
    other.name == name &&
    other.title == title &&
    other.author == author &&
    other.description == description &&
    other.price == price;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (title.hashCode) +
    (author.hashCode) +
    (description.hashCode) +
    (price.hashCode);

  @override
  String toString() => 'BookProfilerList[name=$name, title=$title, author=$author, description=$description, price=$price]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'title'] = this.title;
      json[r'author'] = this.author;
      json[r'description'] = this.description;
      json[r'price'] = this.price;
    return json;
  }

  /// Returns a new [BookProfilerList] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BookProfilerList? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "BookProfilerList[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "BookProfilerList[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BookProfilerList(
        name: mapValueOfType<bool>(json, r'name') ?? true,
        title: mapValueOfType<bool>(json, r'title') ?? true,
        author: mapValueOfType<bool>(json, r'author') ?? true,
        description: mapValueOfType<bool>(json, r'description') ?? true,
        price: mapValueOfType<bool>(json, r'price') ?? true,
      );
    }
    return null;
  }

  static List<BookProfilerList> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BookProfilerList>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BookProfilerList.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BookProfilerList> mapFromJson(dynamic json) {
    final map = <String, BookProfilerList>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BookProfilerList.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BookProfilerList-objects as value to a dart map
  static Map<String, List<BookProfilerList>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BookProfilerList>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BookProfilerList.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

