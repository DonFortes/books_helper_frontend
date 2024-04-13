// Flutter imports:
import 'package:books_library_frontend/providers/auth_provider.dart';
import 'package:books_library_frontend/providers/book_fields_provider.dart';
import 'package:books_library_frontend/providers/book_provider.dart';
import 'package:books_library_frontend/providers/column_state_provider.dart';
import 'package:books_library_frontend/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ChangeNotifierProvider<BookProvider>(create: (_) => BookProvider()),
      ChangeNotifierProvider<ColumnsStateProvider>(create: (_) => ColumnsStateProvider()),
      ChangeNotifierProvider<BookFieldsProvider>(create: (_) => BookFieldsProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('ru'),
      ],
      locale: const Locale('ru'),
      routerConfig: router,
    );
  }
}
