// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../constant_objects.dart';
import '../app_theme.dart';

class LeftSideBar extends StatelessWidget {
  const LeftSideBar({super.key, required this.extended, required this.selectedIndex});

  final bool extended;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return SafeArea(
      child: NavigationRail(
        backgroundColor: theme.colorScheme.background.withOpacity(0.2),
        extended: extended,
        selectedIndex: selectedIndex,
        onDestinationSelected: (int value) {
          String rout = barOrderMap[value]!;
          context.go(routeMap[rout]!);
        },
        leading: extended
            ? Padding(
                padding: const EdgeInsets.only(top: 11, bottom: 15, left: 15, right: 8),
                child: Row(
                  children: <Widget>[
                    const ThemeModeSelector(),
                    const SizedBox(width: 10),
                    Text(
                      'Books',
                      textAlign: TextAlign.left,
                      style: style.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                          color: theme.colorScheme.onSurface.withOpacity(0.7)),
                    ),
                  ],
                ),
              )
            : null,
        destinations: [
          NavigationRailDestination(
              icon: const Icon(Icons.my_library_books_outlined),
              label: Text(
                routeLabelMap['books-page']!,
                style: const TextStyle(fontSize: 15.0),
              )),
          NavigationRailDestination(
              icon: const Icon(Icons.logout),
              label: Text(
                routeLabelMap['logout']!,
                style: const TextStyle(fontSize: 15.0),
              )),
        ],
      ),
    );
  }
}
