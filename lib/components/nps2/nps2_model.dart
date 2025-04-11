import '/flutter_flow/flutter_flow_util.dart';
import 'nps2_widget.dart' show Nps2Widget;
import 'package:flutter/material.dart';

class Nps2Model extends FlutterFlowModel<Nps2Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
