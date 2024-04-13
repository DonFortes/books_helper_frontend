// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../components/login_form.dart';

// Project imports:

class LoginPage extends StatelessWidget {

  const LoginPage({Key? key, this.query}) : super(key: key);
  final Map<String, List<String>>? query;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoginForm(),
    );
  }
}
