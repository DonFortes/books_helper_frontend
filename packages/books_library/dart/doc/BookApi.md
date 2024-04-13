# books_library_gateway.api.BookApi

## Load the API package
```dart
import 'package:books_library_gateway/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**bookCreate**](BookApi.md#bookcreate) | **POST** /book/ | 
[**bookDestroy**](BookApi.md#bookdestroy) | **DELETE** /book/{id}/ | 
[**bookList**](BookApi.md#booklist) | **GET** /book/ | 
[**bookPartialUpdate**](BookApi.md#bookpartialupdate) | **PATCH** /book/{id}/ | 
[**bookRetrieve**](BookApi.md#bookretrieve) | **GET** /book/{id}/ | 
[**bookUpdate**](BookApi.md#bookupdate) | **PUT** /book/{id}/ | 


# **bookCreate**
> Book bookCreate(bookRequest)



### Example
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

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookRequest** | [**BookRequest**](BookRequest.md)|  | 

### Return type

[**Book**](Book.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **bookDestroy**
> bookDestroy(id)



### Example
```dart
import 'package:books_library_gateway/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';

final api_instance = BookApi();
final id = 56; // int | A unique integer value identifying this Book.

try {
    api_instance.bookDestroy(id);
} catch (e) {
    print('Exception when calling BookApi->bookDestroy: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this Book. | 

### Return type

void (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **bookList**
> PaginatedBookList bookList(page)



### Example
```dart
import 'package:books_library_gateway/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';

final api_instance = BookApi();
final page = 56; // int | A page number within the paginated result set.

try {
    final result = api_instance.bookList(page);
    print(result);
} catch (e) {
    print('Exception when calling BookApi->bookList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| A page number within the paginated result set. | [optional] 

### Return type

[**PaginatedBookList**](PaginatedBookList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **bookPartialUpdate**
> Book bookPartialUpdate(id, patchedBookRequest)



### Example
```dart
import 'package:books_library_gateway/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';

final api_instance = BookApi();
final id = 56; // int | A unique integer value identifying this Book.
final patchedBookRequest = PatchedBookRequest(); // PatchedBookRequest | 

try {
    final result = api_instance.bookPartialUpdate(id, patchedBookRequest);
    print(result);
} catch (e) {
    print('Exception when calling BookApi->bookPartialUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this Book. | 
 **patchedBookRequest** | [**PatchedBookRequest**](PatchedBookRequest.md)|  | [optional] 

### Return type

[**Book**](Book.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **bookRetrieve**
> Book bookRetrieve(id)



### Example
```dart
import 'package:books_library_gateway/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';

final api_instance = BookApi();
final id = 56; // int | A unique integer value identifying this Book.

try {
    final result = api_instance.bookRetrieve(id);
    print(result);
} catch (e) {
    print('Exception when calling BookApi->bookRetrieve: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this Book. | 

### Return type

[**Book**](Book.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **bookUpdate**
> Book bookUpdate(id, bookRequest)



### Example
```dart
import 'package:books_library_gateway/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';

final api_instance = BookApi();
final id = 56; // int | A unique integer value identifying this Book.
final bookRequest = BookRequest(); // BookRequest | 

try {
    final result = api_instance.bookUpdate(id, bookRequest);
    print(result);
} catch (e) {
    print('Exception when calling BookApi->bookUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| A unique integer value identifying this Book. | 
 **bookRequest** | [**BookRequest**](BookRequest.md)|  | 

### Return type

[**Book**](Book.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

