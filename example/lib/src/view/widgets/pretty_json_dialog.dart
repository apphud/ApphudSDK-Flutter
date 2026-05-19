import 'dart:convert';

import 'package:flutter/material.dart';

void showPrettyJsonDialog(
  BuildContext context,
  String title,
  Object? data,
) {
  final pretty = const JsonEncoder.withIndent('  ').convert(data);
  showDialog<void>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: SelectableText(
          pretty,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 12,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
