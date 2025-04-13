// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DateTime?> pickTime() async {
  final TimeOfDay? picked = await showTimePicker(
    context: FFAppState().context!,
    initialTime: TimeOfDay.now(),
  );

  if (picked != null) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
  }

  return null;
}

class FFAppState {
  get context => null;
}
