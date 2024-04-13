// Flutter imports:
import 'package:books_library_frontend/pages/login.dart';
import 'package:books_library_frontend/pages/logout.dart';
import 'package:books_library_frontend/pages/not_found_page.dart';
import 'package:books_library_frontend/providers/auth_provider.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yaru/theme.dart';

// Project imports:
import 'app_theme.dart';
import 'constant_objects.dart';
import 'layout_selector.dart';
import 'pages/desktop/main_page.dart';

StatelessWidget responsiveBuilder({
  required BuildContext context,
  required GoRouterState state,
  required Widget desktopPage,
}) {
  return Builder(
    builder: (BuildContext context) => YaruTheme(
      data: AppTheme.of(context),
      child: LayoutSelector(
        desktopPage: desktopPage,
      ),
    ),
  );
}

CustomTransitionPage buildPageWithoutAnimation({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder:
          (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
              child);
}

final GoRouter router = GoRouter(
  initialLocation: routeMap['books-page'],
  redirect: (BuildContext context, GoRouterState state) async {
    if (context.read<AuthProvider>().isSignedIn()) {
      return null;
    } else {
      return routeMap['login']!;
    }
  },
  routes: <RouteBase>[
    GoRoute(
      path: routeMap['books-page']!,
      pageBuilder: (BuildContext context, GoRouterState state) => buildPageWithoutAnimation(
        context: context,
        state: state,
        child: responsiveBuilder(
          context: context,
          state: state,
          desktopPage: const SingleDispatchDesktopPage(),
        ),
      ),
    ),
    GoRoute(
      path: routeMap['logout']!,
      pageBuilder: (BuildContext context, GoRouterState state) => buildPageWithoutAnimation(
        context: context,
        state: state,
        child: responsiveBuilder(
          context: context,
          state: state,
          desktopPage: const LogoutPage(),
        ),
      ),
    ),
    GoRoute(
      path: routeMap['login']!,
      pageBuilder: (BuildContext context, GoRouterState state) => buildPageWithoutAnimation(
        context: context,
        state: state,
        child: responsiveBuilder(
          context: context,
          state: state,
          desktopPage: const LoginPage(),
        ),
      ),
    ),
  ],
  errorBuilder: (BuildContext context, GoRouterState state) {
    return const NotFoundPage();
  },
);
