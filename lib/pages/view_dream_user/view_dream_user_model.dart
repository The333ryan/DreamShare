import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'view_dream_user_widget.dart' show ViewDreamUserWidget;
import 'package:flutter/material.dart';

class ViewDreamUserModel extends FlutterFlowModel<ViewDreamUserWidget> {
  ///  Local state fields for this page.

  String apiResponse = 'Response';

  DateTime? selectedWakeupTime;

  ///  State fields for stateful widgets in this page.

  // State field(s) for UserDreamInput widget.
  FocusNode? userDreamInputFocusNode;
  TextEditingController? userDreamInputTextController;
  String? Function(BuildContext, String?)?
      userDreamInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (geminiAI)] action in AIButton widget.
  ApiCallResponse? apiResult5sc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userDreamInputFocusNode?.dispose();
    userDreamInputTextController?.dispose();
  }
}
