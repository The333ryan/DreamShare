import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_user_widget.dart' show SearchUserWidget;
import 'package:flutter/material.dart';

class SearchUserModel extends FlutterFlowModel<SearchUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults1 = [];
  List<UsersRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
