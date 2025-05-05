import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comment/comment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view_dream_other_model.dart';
export 'view_dream_other_model.dart';

class ViewDreamOtherWidget extends StatefulWidget {
  const ViewDreamOtherWidget({
    super.key,
    required this.dreamView,
    required this.authorDocReference,
    required this.authorDoc,
  });

  final DreamsRecord? dreamView;
  final DocumentReference? authorDocReference;
  final UsersRecord? authorDoc;

  static String routeName = 'viewDreamOther';
  static String routePath = '/viewDreamOther';

  @override
  State<ViewDreamOtherWidget> createState() => _ViewDreamOtherWidgetState();
}

class _ViewDreamOtherWidgetState extends State<ViewDreamOtherWidget>
    with TickerProviderStateMixin {
  late ViewDreamOtherModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewDreamOtherModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'viewDreamOther'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.commentTextFieldTextController ??= TextEditingController();
    _model.commentTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/DreamshareNightBack.jpg'
                    : 'assets/images/dawid-zawila--G3rw6Y02D0-unsplash.jpg',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('VIEW_DREAM_OTHER_PAGE__BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(DreamListWidget.routeName);
                        },
                        text: '',
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: 60.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconAlignment: IconAlignment.start,
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            Theme.of(context).brightness == Brightness.dark
                                ? colorFromCssString(
                                    getRemoteConfigString('button_color_night'),
                                    defaultColor: Color(0xFF4900FF),
                                  )
                                : colorFromCssString(
                                    getRemoteConfigString('button_color_day'),
                                    defaultColor: Color(0xFFAACCFF),
                                  ),
                            Color(0xFF4900FF),
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                font: FlutterFlowTheme.of(context).titleSmall,
                                color: valueOrDefault<Color>(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colorFromCssString(
                                          getRemoteConfigString('text_night'),
                                          defaultColor: Color(0xFFAACCFF),
                                        )
                                      : colorFromCssString(
                                          getRemoteConfigString('text_day'),
                                          defaultColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                  Color(0xFFAACCFF),
                                ),
                                letterSpacing: 0.0,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.network(
                                valueOrDefault<String>(
                                  widget.dreamView?.photoUrl,
                                  'https://picsum.photos/seed/624/600',
                                ),
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.dreamView?.displayName,
                                'name',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    color: valueOrDefault<Color>(
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colorFromCssString(
                                              getRemoteConfigString(
                                                  'text_night'),
                                              defaultColor: Color(0xFFAACCFF),
                                            )
                                          : colorFromCssString(
                                              getRemoteConfigString('text_day'),
                                              defaultColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                      Color(0xFFAACCFF),
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(SizedBox(width: 15.0)),
                        ),
                        Text(
                          valueOrDefault<String>(
                            dateTimeFormat("yMd", widget.dreamView?.date),
                            'date',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                font: FlutterFlowTheme.of(context).titleSmall,
                                color: valueOrDefault<Color>(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colorFromCssString(
                                          getRemoteConfigString('text_night'),
                                          defaultColor: Color(0xFFAACCFF),
                                        )
                                      : colorFromCssString(
                                          getRemoteConfigString('text_day'),
                                          defaultColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                  Color(0xFFAACCFF),
                                ),
                                letterSpacing: 0.0,
                              ),
                        ),
                        StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord.where(
                              'uid',
                              isEqualTo: widget.dreamView?.uid,
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UsersRecord> buttonUsersRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonUsersRecord =
                                buttonUsersRecordList.isNotEmpty
                                    ? buttonUsersRecordList.first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'VIEW_DREAM_OTHER_PAGE_FOLLOW_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'following': FieldValue.arrayUnion(
                                          [currentUserUid]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('Button_backend_call');

                                await widget.authorDocReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'followers': FieldValue.arrayUnion(
                                          [currentUserReference?.id]),
                                    },
                                  ),
                                });
                              },
                              text: 'Follow',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<Color>(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colorFromCssString(
                                          getRemoteConfigString(
                                              'button_color_night'),
                                          defaultColor: Color(0xFF4900FF),
                                        )
                                      : colorFromCssString(
                                          getRemoteConfigString(
                                              'button_color_day'),
                                          defaultColor: Color(0xFFAACCFF),
                                        ),
                                  Color(0xFF4900FF),
                                ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.exo2(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: valueOrDefault<Color>(
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? colorFromCssString(
                                                getRemoteConfigString(
                                                    'text_night'),
                                                defaultColor: Color(0xFFAACCFF),
                                              )
                                            : colorFromCssString(
                                                getRemoteConfigString(
                                                    'text_day'),
                                                defaultColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                        Color(0xFFAACCFF),
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.dreamView?.dreamTitle,
                        'Title',
                      ),
                      style: FlutterFlowTheme.of(context)
                          .headlineLarge
                          .override(
                            font: FlutterFlowTheme.of(context).headlineLarge,
                            color: valueOrDefault<Color>(
                              Theme.of(context).brightness == Brightness.dark
                                  ? colorFromCssString(
                                      getRemoteConfigString('text_night'),
                                      defaultColor: Color(0xFFAACCFF),
                                    )
                                  : colorFromCssString(
                                      getRemoteConfigString('text_day'),
                                      defaultColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                              Color(0xFFAACCFF),
                            ),
                            letterSpacing: 0.0,
                          ),
                    ),
                    Flexible(
                      child: Container(
                        width: 350.0,
                        height: 283.4,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(18.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.dreamView?.dreamDescription,
                                'description',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.exo2(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor: valueOrDefault<Color>(
                                Theme.of(context).brightness == Brightness.dark
                                    ? colorFromCssString(
                                        getRemoteConfigString('text_night'),
                                        defaultColor: Color(0xFFAACCFF),
                                      )
                                    : colorFromCssString(
                                        getRemoteConfigString('text_day'),
                                        defaultColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                Color(0xFFAACCFF),
                              ),
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.exo2(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    letterSpacing: 0.0,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              tabs: [
                                Tab(
                                  text: 'Friend\'s Comments',
                                ),
                                Tab(
                                  text: 'Everyone\'s Comments',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        width: 350.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          children: [],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        width: 350.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFD1FE),
                                        ),
                                        child:
                                            StreamBuilder<List<CommentRecord>>(
                                          stream: queryCommentRecord(
                                            queryBuilder: (commentRecord) =>
                                                commentRecord
                                                    .where(
                                                      'dreamTitle',
                                                      isEqualTo: widget
                                                          .dreamView
                                                          ?.dreamTitle,
                                                    )
                                                    .where(
                                                      'dreamDate',
                                                      isEqualTo: widget
                                                          .dreamView?.date,
                                                    )
                                                    .where(
                                                      'uidPost',
                                                      isEqualTo: widget
                                                          .dreamView?.uid,
                                                    ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CommentRecord>
                                                listViewCommentRecordList =
                                                snapshot.data!;

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewCommentRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewCommentRecord =
                                                    listViewCommentRecordList[
                                                        listViewIndex];
                                                return StreamBuilder<
                                                    List<CommentRecord>>(
                                                  stream: queryCommentRecord(
                                                    queryBuilder:
                                                        (commentRecord) =>
                                                            commentRecord
                                                                .where(
                                                                  'dreamTitle',
                                                                  isEqualTo: widget
                                                                      .dreamView
                                                                      ?.dreamTitle,
                                                                )
                                                                .where(
                                                                  'dreamDate',
                                                                  isEqualTo: widget
                                                                      .dreamView
                                                                      ?.date,
                                                                )
                                                                .where(
                                                                  'uidPost',
                                                                  isEqualTo: widget
                                                                      .dreamView
                                                                      ?.uid,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CommentRecord>
                                                        commentCommentRecordList =
                                                        snapshot.data!;

                                                    return CommentWidget(
                                                      key: Key(
                                                          'Keyfvn_${listViewIndex}_of_${listViewCommentRecordList.length}'),
                                                      commentDoc:
                                                          listViewCommentRecord,
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Container(
                        width: 350.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller:
                                          _model.commentTextFieldTextController,
                                      focusNode:
                                          _model.commentTextFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Enter Comment...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.exo2(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .commentTextFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'VIEW_DREAM_OTHER_CommentButton_ON_TAP');
                                    logFirebaseEvent(
                                        'CommentButton_validate_form');
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    logFirebaseEvent(
                                        'CommentButton_backend_call');

                                    await CommentRecord.collection
                                        .doc()
                                        .set(createCommentRecordData(
                                          dreamDate: widget.dreamView?.date,
                                          dreamTitle:
                                              widget.dreamView?.dreamTitle,
                                          commentText: _model
                                              .commentTextFieldTextController
                                              .text,
                                          uidPost: widget.authorDoc?.uid,
                                          uidComment: currentUserUid,
                                          profilePicture: currentUserPhoto,
                                          dateCommented: getCurrentTimestamp,
                                          authorUsername:
                                              currentUserDisplayName,
                                        ));
                                  },
                                  text: 'Comment',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: valueOrDefault<Color>(
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? colorFromCssString(
                                              getRemoteConfigString(
                                                  'button_color_night'),
                                              defaultColor: Color(0xFF4900FF),
                                            )
                                          : colorFromCssString(
                                              getRemoteConfigString(
                                                  'button_color_day'),
                                              defaultColor: Color(0xFFAACCFF),
                                            ),
                                      Color(0xFF4900FF),
                                    ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.exo2(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: valueOrDefault<Color>(
                                            Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? colorFromCssString(
                                                    getRemoteConfigString(
                                                        'text_night'),
                                                    defaultColor:
                                                        Color(0xFFAACCFF),
                                                  )
                                                : colorFromCssString(
                                                    getRemoteConfigString(
                                                        'text_day'),
                                                    defaultColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                            Color(0xFFAACCFF),
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ),
            ].divide(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
