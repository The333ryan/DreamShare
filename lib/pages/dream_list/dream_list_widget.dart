import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dream/dream_widget.dart';
import '/components/search_user/search_user_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dream_list_model.dart';
export 'dream_list_model.dart';

class DreamListWidget extends StatefulWidget {
  const DreamListWidget({super.key});

  static String routeName = 'DreamList';
  static String routePath = '/dreamList';

  @override
  State<DreamListWidget> createState() => _DreamListWidgetState();
}

class _DreamListWidgetState extends State<DreamListWidget>
    with TickerProviderStateMixin {
  late DreamListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DreamListModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'DreamList'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
        backgroundColor: colorFromCssString(
          getRemoteConfigString('lightmode_background'),
          defaultColor: Color(0xFFC155FF),
        ),
        floatingActionButton: FloatingActionButton(
          key: ValueKey('FloatingActionButton_csqu'),
          onPressed: () async {
            logFirebaseEvent('DREAM_LIST_FloatingActionButton_k6pec3yo');
            logFirebaseEvent('FloatingActionButton_navigate_to');

            context.pushNamed(AddDreamWidget.routeName);

            logFirebaseEvent('FloatingActionButton_google_analytics_ev');
            logFirebaseEvent(
              'Add_Dream_On_Tap',
              parameters: {
                'User ID': currentUserUid,
              },
            );
          },
          backgroundColor: colorFromCssString(
            getRemoteConfigString('darkmode_background'),
            defaultColor: FlutterFlowTheme.of(context).secondary,
          ),
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      key: ValueKey('DreamFeedText_mlb9'),
                      'Dream Feed',
                      style: FlutterFlowTheme.of(context).displayLarge.override(
                            fontFamily: 'Exo 2',
                            color: colorFromCssString(
                              getRemoteConfigString('darkmode_background'),
                              defaultColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Exo 2'),
                          ),
                    ),
                  ),
                  Builder(
                    builder: (context) => FlutterFlowIconButton(
                      borderRadius: 8.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.search,
                        color: FlutterFlowTheme.of(context).info,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('DREAM_LIST_PAGE_search_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(dialogContext).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: SearchUserWidget(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Exo 2',
                                  letterSpacing: 0.0,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Exo 2'),
                                ),
                        unselectedLabelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                        indicatorColor: FlutterFlowTheme.of(context).primary,
                        tabs: [
                          Tab(
                            text: 'Friends',
                          ),
                          Tab(
                            text: 'Everyone',
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: StreamBuilder<List<DreamsRecord>>(
                              stream: queryDreamsRecord(
                                queryBuilder: (dreamsRecord) =>
                                    dreamsRecord.where(
                                  'uid',
                                  isEqualTo: currentUserUid,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<DreamsRecord> listViewDreamsRecordList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewDreamsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewDreamsRecord =
                                        listViewDreamsRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'uid',
                                            isEqualTo: listViewDreamsRecord.uid,
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              dreamUsersRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final dreamUsersRecord =
                                              dreamUsersRecordList.isNotEmpty
                                                  ? dreamUsersRecordList.first
                                                  : null;

                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DREAM_LIST_Container_rfa73ojg_ON_TAP');
                                              logFirebaseEvent(
                                                  'Dream_navigate_to');

                                              context.pushNamed(
                                                ViewDreamOtherWidget.routeName,
                                                queryParameters: {
                                                  'dreamView': serializeParam(
                                                    listViewDreamsRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'authorDocReference':
                                                      serializeParam(
                                                    dreamUsersRecord?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'authorDoc': serializeParam(
                                                    dreamUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'dreamView':
                                                      listViewDreamsRecord,
                                                  'authorDoc': dreamUsersRecord,
                                                },
                                              );

                                              logFirebaseEvent(
                                                  'Dream_google_analytics_event');
                                              logFirebaseEvent(
                                                'Dream_On_Tap',
                                                parameters: {
                                                  'User ID': currentUserUid,
                                                },
                                              );
                                            },
                                            child: DreamWidget(
                                              key: Key(
                                                  'Keyrfa_${listViewIndex}_of_${listViewDreamsRecordList.length}'),
                                              dreamDoc: listViewDreamsRecord,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: StreamBuilder<List<DreamsRecord>>(
                              stream: queryDreamsRecord(
                                queryBuilder: (dreamsRecord) =>
                                    dreamsRecord.where(
                                  'uid',
                                  isEqualTo: currentUserUid,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<DreamsRecord> listViewDreamsRecordList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewDreamsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewDreamsRecord =
                                        listViewDreamsRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'uid',
                                            isEqualTo: listViewDreamsRecord.uid,
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              dreamUsersRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final dreamUsersRecord =
                                              dreamUsersRecordList.isNotEmpty
                                                  ? dreamUsersRecordList.first
                                                  : null;

                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DREAM_LIST_Container_q38m4kit_ON_TAP');
                                              logFirebaseEvent(
                                                  'Dream_navigate_to');

                                              context.pushNamed(
                                                ViewDreamOtherWidget.routeName,
                                                queryParameters: {
                                                  'dreamView': serializeParam(
                                                    listViewDreamsRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'authorDocReference':
                                                      serializeParam(
                                                    dreamUsersRecord?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'authorDoc': serializeParam(
                                                    dreamUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'dreamView':
                                                      listViewDreamsRecord,
                                                  'authorDoc': dreamUsersRecord,
                                                },
                                              );

                                              logFirebaseEvent(
                                                  'Dream_google_analytics_event');
                                              logFirebaseEvent(
                                                'Dream_On_Tap',
                                                parameters: {
                                                  'User ID': currentUserUid,
                                                },
                                              );
                                            },
                                            child: DreamWidget(
                                              key: Key(
                                                  'Keyq38_${listViewIndex}_of_${listViewDreamsRecordList.length}'),
                                              dreamDoc: listViewDreamsRecord,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
