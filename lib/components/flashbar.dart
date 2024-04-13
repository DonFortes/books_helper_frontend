// Flutter imports:
// Package imports:
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

void showFlashBar(BuildContext context, ColorScheme colorScheme, TextStyle style) {
  context.showFlash(
    barrierDismissible: true,
    duration: const Duration(seconds: 3),
    builder: (BuildContext context, FlashController controller) => FlashBar(
      backgroundColor: colorScheme.primary,
      position: FlashPosition.top,
      controller: controller,
      content: Text(
        'Книга создана',
        style: style.copyWith(fontWeight: FontWeight.w400, fontSize: 25, color: colorScheme.onBackground),
      ),
    ),
  );
}
