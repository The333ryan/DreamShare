import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? formatTimeToHHmm() {
  // The purpose of the formatTimeToHHmm function is to take a DateTime value selected by the user (such as from a Time Picker) and convert it into a string formatted as "HH:mm" — for example, "07:15" or "22:30". This string format is easy to save in Firestore and works perfectly with scheduled Cloud Functions that check specific times (like sending a notification 15 minutes before a user's wakeup time
  String formatTimeToHHmm(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }
}

List<String>? scheduleNotifications(
  String? wakeupTime,
  String? bedTime,
  String? userTimezone,
  String? dateTime,
) {
  // Formats wakeup and bedtime notifications 15 minutes early. Returns the notification times as ["HH:mm", "HH:mm"].
  if (wakeupTime == null || bedTime == null || dateTime == null) {
    return null;
  }

  DateTime now = DateTime.parse(dateTime);
  DateTime wakeupDateTime = DateFormat('HH:mm').parse(wakeupTime);
  DateTime bedDateTime = DateFormat('HH:mm').parse(bedTime);

  DateTime scheduledWakeup = DateTime(now.year, now.month, now.day,
          wakeupDateTime.hour, wakeupDateTime.minute)
      .subtract(Duration(minutes: 15));
  DateTime scheduledBed = DateTime(
          now.year, now.month, now.day, bedDateTime.hour, bedDateTime.minute)
      .subtract(Duration(minutes: 15));

  String formattedWakeup = DateFormat('HH:mm').format(scheduledWakeup);
  String formattedBed = DateFormat('HH:mm').format(scheduledBed);

  return [formattedWakeup, formattedBed];
}
