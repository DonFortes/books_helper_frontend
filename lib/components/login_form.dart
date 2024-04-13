// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Package imports:
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../constant_objects.dart';
import '../providers/auth_provider.dart';

// Project imports:
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController _usernameInputController;
  late TextEditingController _passwordInputController;
  late String _errorText;
  bool _isUsernameError = false;
  bool _isPasswordError = false;

  @override
  void initState() {
    super.initState();
    _usernameInputController = TextEditingController();
    _passwordInputController = TextEditingController();
    _errorText = '';
  }

  void _resetErrors() {
    setState(() {
      _isPasswordError = false;
      _isUsernameError = false;
      _errorText = '';
    });
  }

  Future<void> _doLogin(BuildContext context) async {
    context
        .read<AuthProvider>()
        .saveAuthData(username: _usernameInputController.text, password: _passwordInputController.text);
  }

  bool _isInputValid() {
    if (_usernameInputController.text.isEmpty) {
      setState(() {
        _errorText = 'Имя пользователя должно быть заполнено';
        _isUsernameError = true;
      });
      return false;
    }
    if (_passwordInputController.text.isEmpty) {
      setState(() {
        _errorText = 'Пароль должен быть заполнен';
        _isPasswordError = true;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: AutofillGroup(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Войти',
                  style: TextStyle(fontSize: 32),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 8),
                  child: SizedBox(
                    width: 300,
                    height: 48,
                    child: TextFormField(
                      controller: _usernameInputController,
                      onChanged: (String value) {
                        _resetErrors();
                      },
                      autofillHints: const [AutofillHints.username],
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                        labelText: 'Имя пользователя',
                        enabledBorder: _isUsernameError
                            ? const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
                  child: SizedBox(
                    width: 300,
                    height: 48,
                    child: TextFormField(
                      controller: _passwordInputController,
                      onChanged: (String value) {
                        _resetErrors();
                      },
                      autofillHints: const [AutofillHints.password],
                      onEditingComplete: () => TextInput.finishAutofillContext(),
                      obscureText: true,
                      onFieldSubmitted: (value) async {
                        _resetErrors();
                        if (_isInputValid()) {
                          await _doLogin(context);
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                        labelText: 'Пароль',
                        enabledBorder: _isPasswordError
                            ? const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  _errorText,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 56),
                  child: ElevatedButton(
                    onPressed: () async {
                      _resetErrors();
                      TextInput.finishAutofillContext();
                      if (_isInputValid()) {
                        await _doLogin(context);
                      }
                      if (context.read<AuthProvider>().isSignedIn()) {
                        context.go(routeMap['books-page']!);
                      }
                    },
                    child: const Text(
                      'Войти',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  Test user
// string@m.ru
// string
