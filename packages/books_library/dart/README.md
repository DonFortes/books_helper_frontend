# books_library_gateway
Service to work with books library

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 0.0.0
- Generator version: 7.4.0
- Build package: org.openapitools.codegen.languages.DartClientCodegen

## Requirements

Dart 2.12 or later

## Installation & Usage

### Github
If this Dart package is published to Github, add the following dependency to your pubspec.yaml
```
dependencies:
  books_library_gateway:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
```

### Local
To use the package in your local drive, add the following dependency to your pubspec.yaml
```
dependencies:
  books_library_gateway:
    path: /path/to/books_library_gateway
```

## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:books_library_gateway/api.dart';

// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';

final api_instance = BookApi();
final bookRequest = BookRequest(); // BookRequest | 

try {
    final result = api_instance.bookCreate(bookRequest);
    print(result);
} catch (e) {
    print('Exception when calling BookApi->bookCreate: $e\n');
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*BookApi* | [**bookCreate**](doc//BookApi.md#bookcreate) | **POST** /book/ | 
*BookApi* | [**bookDestroy**](doc//BookApi.md#bookdestroy) | **DELETE** /book/{id}/ | 
*BookApi* | [**bookList**](doc//BookApi.md#booklist) | **GET** /book/ | 
*BookApi* | [**bookPartialUpdate**](doc//BookApi.md#bookpartialupdate) | **PATCH** /book/{id}/ | 
*BookApi* | [**bookRetrieve**](doc//BookApi.md#bookretrieve) | **GET** /book/{id}/ | 
*BookApi* | [**bookUpdate**](doc//BookApi.md#bookupdate) | **PUT** /book/{id}/ | 
*ProfileApi* | [**profileCreate**](doc//ProfileApi.md#profilecreate) | **POST** /profile/ | 
*ProfileApi* | [**profileList**](doc//ProfileApi.md#profilelist) | **GET** /profile/ | 


## Documentation For Models

 - [Book](doc//Book.md)
 - [BookProfilerCreate](doc//BookProfilerCreate.md)
 - [BookProfilerCreateRequest](doc//BookProfilerCreateRequest.md)
 - [BookProfilerList](doc//BookProfilerList.md)
 - [BookRequest](doc//BookRequest.md)
 - [PaginatedBookList](doc//PaginatedBookList.md)
 - [PatchedBookRequest](doc//PatchedBookRequest.md)


## Documentation For Authorization


Authentication schemes defined for the API:
### basicAuth

- **Type**: HTTP Basic authentication


## Author



