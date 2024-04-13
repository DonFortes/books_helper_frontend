// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'constant_objects.dart';

// Project imports:

class LayoutSelector extends StatelessWidget {
  const LayoutSelector({
    super.key,
    required this.desktopPage,
  });

  final Widget desktopPage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          body: desktopPage,
        );
    });
  }
}
