// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../constant_objects.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64),
          Text(
            'Page not found',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          OutlinedButton(onPressed: () => context.go(routeMap['mass_dispatch']!), child: const Text('Back')),
        ],
      ),
    );
  }
}
