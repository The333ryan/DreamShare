import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for wakeupTimeField widget.
  FocusNode? wakeupTimeFieldFocusNode;
  TextEditingController? wakeupTimeFieldTextController;
  String? Function(BuildContext, String?)?
      wakeupTimeFieldTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for bedTimeField widget.
  FocusNode? bedTimeFieldFocusNode;
  TextEditingController? bedTimeFieldTextController;
  String? Function(BuildContext, String?)? bedTimeFieldTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    wakeupTimeFieldFocusNode?.dispose();
    wakeupTimeFieldTextController?.dispose();

    bedTimeFieldFocusNode?.dispose();
    bedTimeFieldTextController?.dispose();
  }
}
