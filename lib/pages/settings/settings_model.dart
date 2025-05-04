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
  // State field(s) for DropDown1 widget.
  String? dropDown1Value;
  FormFieldController<String>? dropDown1ValueController;
  // State field(s) for bedTimeField widget.
  FocusNode? bedTimeFieldFocusNode;
  TextEditingController? bedTimeFieldTextController;
  String? Function(BuildContext, String?)? bedTimeFieldTextControllerValidator;
  // State field(s) for DropDown2 widget.
  String? dropDown2Value;
  FormFieldController<String>? dropDown2ValueController;

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
