import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth_page_widget.dart' show AuthPageWidget;
import 'package:flutter/material.dart';

class AuthPageModel extends FlutterFlowModel<AuthPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - userTimezone] action in AuthPage widget.
  String? timezoneName;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    emailTextController?.dispose();

    textFieldFocusNode2?.dispose();
    passwordTextController?.dispose();
  }
}
