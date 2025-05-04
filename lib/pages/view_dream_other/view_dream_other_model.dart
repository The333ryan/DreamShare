import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'view_dream_other_widget.dart' show ViewDreamOtherWidget;
import 'package:flutter/material.dart';

class ViewDreamOtherModel extends FlutterFlowModel<ViewDreamOtherWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for CommentTextField widget.
  FocusNode? commentTextFieldFocusNode;
  TextEditingController? commentTextFieldTextController;
  String? Function(BuildContext, String?)?
      commentTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    commentTextFieldFocusNode?.dispose();
    commentTextFieldTextController?.dispose();
  }
}
