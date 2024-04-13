//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ProfileApi {
  ProfileApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /profile/' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [BookProfilerCreateRequest] bookProfilerCreateRequest (required):
  Future<Response> profileCreateWithHttpInfo(BookProfilerCreateRequest bookProfilerCreateRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/profile/';

    // ignore: prefer_final_locals
    Object? postBody = bookProfilerCreateRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [BookProfilerCreateRequest] bookProfilerCreateRequest (required):
  Future<BookProfilerCreate?> profileCreate(BookProfilerCreateRequest bookProfilerCreateRequest,) async {
    final response = await profileCreateWithHttpInfo(bookProfilerCreateRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'BookProfilerCreate',) as BookProfilerCreate;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /profile/' operation and returns the [Response].
  Future<Response> profileListWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/profile/';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<List<BookProfilerList>?> profileList() async {
    final response = await profileListWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<BookProfilerList>') as List)
        .cast<BookProfilerList>()
        .toList(growable: false);

    }
    return null;
  }
}
