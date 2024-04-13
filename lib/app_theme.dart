// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:yaru/yaru.dart';

class AppTheme {
  static YaruThemeData of(BuildContext context) {
    return SharedAppData.getValue(
      context,
      'theme',
      () => const YaruThemeData(variant: YaruVariant.ubuntuMateGreen, useMaterial3: true, themeMode: ThemeMode.light),
    );
  }

  static void apply(
    BuildContext context, {
    YaruVariant? variant,
    bool? highContrast,
    ThemeMode? themeMode,
  }) {
    SharedAppData.setValue(
      context,
      'theme',
      AppTheme.of(context).copyWith(
        themeMode: themeMode,
        variant: variant,
        highContrast: highContrast,
      ),
    );
  }
}

class ThemeModeSelector extends StatefulWidget {
  const ThemeModeSelector({super.key});

  @override
  State<ThemeModeSelector> createState() => _ThemeModeSelectorState();
}

class _ThemeModeSelectorState extends State<ThemeModeSelector> {
  @override
  Widget build(BuildContext context) {
    final YaruThemeData theme = YaruTheme.of(context);
    bool light = theme.themeMode == ThemeMode.light;

    return IconButton(
      onPressed: () {
        AppTheme.apply(
          context,
          themeMode: light ? ThemeMode.dark : ThemeMode.light,
        );
        setState(() {});
      },
      icon: Icon(
        light ? Icons.sunny : Icons.nightlight_outlined,
      ),
    );
  }
}
