// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../constant_objects.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key, this.query}) : super(key: key);
  final Map<String, List<String>>? query;

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Вы вышли из личного кабинета.'),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.go(routeMap['login']!);
                    },
                    child: const Text('Войти снова'))
              ],
            ),
          );
        });
  }
}
