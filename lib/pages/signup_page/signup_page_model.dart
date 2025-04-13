import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'signup_page_widget.dart' show SignupPageWidget;
import 'package:flutter/material.dart';

class SignupPageModel extends FlutterFlowModel<SignupPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SU-Email widget.
  FocusNode? sUEmailFocusNode;
  TextEditingController? sUEmailTextController;
  String? Function(BuildContext, String?)? sUEmailTextControllerValidator;
  // State field(s) for SU-Password widget.
  FocusNode? sUPasswordFocusNode;
  TextEditingController? sUPasswordTextController;
  late bool sUPasswordVisibility;
  String? Function(BuildContext, String?)? sUPasswordTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    sUPasswordVisibility = false;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    sUEmailFocusNode?.dispose();
    sUEmailTextController?.dispose();

    sUPasswordFocusNode?.dispose();
    sUPasswordTextController?.dispose();

    textFieldFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
