// Flutter imports:
import 'package:books_library/api.dart';
import 'package:flutter/foundation.dart';

final HttpBasicAuth basicAuthRepository = HttpBasicAuth();

class AuthProvider with ChangeNotifier, DiagnosticableTreeMixin {
  AuthProvider();

  bool isLoading = false;

  Future<void> saveAuthData({required String username, required String password}) async {
    basicAuthRepository.username = username;
    basicAuthRepository.password = password;
  }

  bool isSignedIn() {
    return basicAuthRepository.username != '' && basicAuthRepository.password != '';
  }
}
