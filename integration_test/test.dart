import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dream_share/flutter_flow/flutter_flow_drop_down.dart';
import 'package:dream_share/flutter_flow/flutter_flow_icon_button.dart';
import 'package:dream_share/flutter_flow/flutter_flow_widgets.dart';
import 'package:dream_share/flutter_flow/flutter_flow_theme.dart';
import 'package:dream_share/index.dart';
import 'package:dream_share/main.dart';
import 'package:dream_share/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:dream_share/backend/firebase/firebase_config.dart';
import 'package:dream_share/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('AI Interpretation', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'michael.dey@uri.edu', password: '21aaaa');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: ProfileWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Dream_p4rs')));
    await tester.tap(find.byKey(const ValueKey('AIButton_ttja')));
  });

  testWidgets('Login', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: AuthPageWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('TextField_l7tb')), 'rminer303@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('TextField_jg6d')), 'aaaa1111');
    await tester.tap(find.byKey(const ValueKey('Button_j5sl')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    expect(find.byKey(const ValueKey('DreamFeedText_mlb9')), findsWidgets);
  });

  testWidgets('create an account ', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 4000));
    await tester.tap(find.byKey(const ValueKey('Text_o9jr')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('Text_o9jr')));
    await tester.pumpAndSettle(const Duration(milliseconds: 4000));
    await tester.tap(find.byKey(const ValueKey('SU-Email_e48h')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('SU-Email_e48h')));
    await tester.enterText(
        find.byKey(const ValueKey('SU-Email_e48h')), 'TestingAcct@gmail.com');
    await tester.tap(find.byKey(const ValueKey('SU-Password_92ks')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('SU-Password_92ks')));
    await tester.enterText(
        find.byKey(const ValueKey('SU-Password_92ks')), 'Testing123');
    await tester.tap(find.byKey(const ValueKey('TextField_s2l2')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('TextField_s2l2')));
    await tester.enterText(
        find.byKey(const ValueKey('TextField_s2l2')), 'Testing123');
    await tester.tap(find.byKey(const ValueKey('Button_2x3f')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('Button_2x3f')));
    await tester.pumpAndSettle(const Duration(milliseconds: 4000));
  });

  testWidgets('creating an account miss match pw', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 4000));
    await tester.tap(find.byKey(const ValueKey('Text_o9jr')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('Text_o9jr')));
    await tester.pumpAndSettle(const Duration(milliseconds: 4000));
    await tester.tap(find.byKey(const ValueKey('SU-Email_e48h')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('SU-Email_e48h')));
    await tester.enterText(
        find.byKey(const ValueKey('SU-Password_92ks')), 'MismatchPW@gmail.com');
    await tester.tap(find.byKey(const ValueKey('SU-Password_92ks')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('SU-Password_92ks')));
    await tester.enterText(
        find.byKey(const ValueKey('SU-Password_92ks')), 'Testing123');
    await tester.tap(find.byKey(const ValueKey('TextField_s2l2')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('TextField_s2l2')));
    await tester.enterText(
        find.byKey(const ValueKey('TextField_s2l2')), 'Testing456');
    await tester.tap(find.byKey(const ValueKey('Button_2x3f')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('Button_2x3f')));
    await tester.pumpAndSettle(const Duration(milliseconds: 4000));
    expect(find.text('error'), findsNothing);
  });

  testWidgets('User logs out', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'test12@gmail.com', password: '123456');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('FloatingActionButton_csqu')));
    await tester.enterText(
        find.byKey(const ValueKey('TextField_h03y')), 'dream title test');
    await tester.enterText(
        find.byKey(const ValueKey('TextField_iqmm')), 'Testing unit test');
    await tester.tap(find.byKey(const ValueKey('Button_uozq')));
    await tester.tap(find.byIcon(Icons.person));
    await tester.tap(find.byKey(const ValueKey('IconButton_eqf7')));
    await tester.tap(find.byKey(const ValueKey('Button_kd1j')));
  });

  testWidgets('Bad Email Format', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: AuthPageWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('TextField_l7tb')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('TextField_l7tb')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('TextField_l7tb')), 'vfaywolfe@@uri.edu');
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
