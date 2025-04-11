import '/flutter_flow/flutter_flow_util.dart';
import 'search_user_widget.dart' show SearchUserWidget;
import 'package:flutter/material.dart';

class SearchUserModel extends FlutterFlowModel<SearchUserWidget> {
  ///  Local state fields for this component.

  String displayName = 'Name';

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
