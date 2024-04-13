# books_library_gateway.api.ProfileApi

## Load the API package
```dart
import 'package:books_library_gateway/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**profileCreate**](ProfileApi.md#profilecreate) | **POST** /profile/ | 
[**profileList**](ProfileApi.md#profilelist) | **GET** /profile/ | 


# **profileCreate**
> BookProfilerCreate profileCreate(bookProfilerCreateRequest)



### Example
```dart
import 'package:books_library_gateway/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';

final api_instance = ProfileApi();
final bookProfilerCreateRequest = BookProfilerCreateRequest(); // BookProfilerCreateRequest | 

try {
    final result = api_instance.profileCreate(bookProfilerCreateRequest);
    print(result);
} catch (e) {
    print('Exception when calling ProfileApi->profileCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bookProfilerCreateRequest** | [**BookProfilerCreateRequest**](BookProfilerCreateRequest.md)|  | 

### Return type

[**BookProfilerCreate**](BookProfilerCreate.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **profileList**
> List<BookProfilerList> profileList()



### Example
```dart
import 'package:books_library_gateway/api.dart';
// TODO Configure HTTP basic authorization: basicAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basicAuth').password = 'YOUR_PASSWORD';

final api_instance = ProfileApi();

try {
    final result = api_instance.profileList();
    print(result);
} catch (e) {
    print('Exception when calling ProfileApi->profileList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<BookProfilerList>**](BookProfilerList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

