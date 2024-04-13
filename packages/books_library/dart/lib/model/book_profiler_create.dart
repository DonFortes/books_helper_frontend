//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BookProfilerCreate {
  /// Returns a new [BookProfilerCreate] instance.
  BookProfilerCreate({
    required this.columnName,
    this.isVisible = true,
  });

  String columnName;

  bool isVisible;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BookProfilerCreate &&
    other.columnName == columnName &&
    other.isVisible == isVisible;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (columnName.hashCode) +
    (isVisible.hashCode);

  @override
  String toString() => 'BookProfilerCreate[columnName=$columnName, isVisible=$isVisible]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'column_name'] = this.columnName;
      json[r'is_visible'] = this.isVisible;
    return json;
  }

  /// Returns a new [BookProfilerCreate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BookProfilerCreate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "BookProfilerCreate[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "BookProfilerCreate[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BookProfilerCreate(
        columnName: mapValueOfType<String>(json, r'column_name')!,
        isVisible: mapValueOfType<bool>(json, r'is_visible') ?? true,
      );
    }
    return null;
  }

  static List<BookProfilerCreate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BookProfilerCreate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BookProfilerCreate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BookProfilerCreate> mapFromJson(dynamic json) {
    final map = <String, BookProfilerCreate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BookProfilerCreate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BookProfilerCreate-objects as value to a dart map
  static Map<String, List<BookProfilerCreate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BookProfilerCreate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BookProfilerCreate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'column_name',
  };
}

