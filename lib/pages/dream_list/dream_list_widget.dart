import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dream/dream_widget.dart';
import '/components/search_user/search_user_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
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
        floatingActionButton: Align(
          alignment: AlignmentDirectional(1.0, 0.85),
          child: FloatingActionButton(
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
            backgroundColor: valueOrDefault<Color>(
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
            elevation: 8.0,
            child: Icon(
              Icons.add_rounded,
              color: valueOrDefault<Color>(
                Theme.of(context).brightness == Brightness.dark
                    ? colorFromCssString(
                        getRemoteConfigString('text_night'),
                        defaultColor: Color(0xFFAACCFF),
                      )
                    : colorFromCssString(
                        getRemoteConfigString('text_day'),
                        defaultColor: FlutterFlowTheme.of(context).secondary,
                      ),
                Color(0xFFAACCFF),
              ),
              size: 24.0,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/DreamshareNightBack.jpg'
                    : 'assets/images/DreamshareDayBack.jpg',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
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
                        style: FlutterFlowTheme.of(context)
                            .displayLarge
                            .override(
                              font: GoogleFonts.exo2(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .displayLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .displayLarge
                                    .fontStyle,
                              ),
                              color: valueOrDefault<Color>(
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
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .displayLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .displayLarge
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Builder(
                      builder: (context) => Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          fillColor: valueOrDefault<Color>(
                            Theme.of(context).brightness == Brightness.dark
                                ? colorFromCssString(
                                    getRemoteConfigString(
                                        'darkmode_background'),
                                    defaultColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  )
                                : colorFromCssString(
                                    getRemoteConfigString('button_color_day'),
                                    defaultColor: Color(0xFFAACCFF),
                                  ),
                            FlutterFlowTheme.of(context).secondary,
                          ),
                          icon: Icon(
                            Icons.search,
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
                            size: 30.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'DREAM_LIST_PAGE_search_ICN_ON_TAP');
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
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: SearchUserWidget(),
                                  ),
                                );
                              },
                            );
                          },
                        ),
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
                          labelColor: valueOrDefault<Color>(
                            Theme.of(context).brightness == Brightness.dark
                                ? colorFromCssString(
                                    getRemoteConfigString('text_night'),
                                    defaultColor: Color(0xFFAACCFF),
                                  )
                                : colorFromCssString(
                                    getRemoteConfigString('text_day'),
                                    defaultColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                            Color(0xFFAACCFF),
                          ),
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
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
                                font: FlutterFlowTheme.of(context).titleMedium,
                                letterSpacing: 0.0,
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
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<DreamsRecord>>(
                                  stream: queryDreamsRecord(
                                    queryBuilder: (dreamsRecord) => dreamsRecord
                                        .whereIn(
                                            'uid',
                                            (currentUserDocument?.following
                                                    .toList() ??
                                                []))
                                        .where(
                                          'isPublic',
                                          isEqualTo: true,
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<DreamsRecord>
                                        listViewDreamsRecordList =
                                        snapshot.data!;

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewDreamsRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewDreamsRecord =
                                            listViewDreamsRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child:
                                              StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                              queryBuilder: (usersRecord) =>
                                                  usersRecord.whereIn(
                                                      'uid',
                                                      (currentUserDocument
                                                              ?.following
                                                              .toList() ??
                                                          [])),
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
                                                        FlutterFlowTheme.of(
                                                                context)
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
                                                  dreamUsersRecordList
                                                          .isNotEmpty
                                                      ? dreamUsersRecordList
                                                          .first
                                                      : null;

                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'DREAM_LIST_Container_rfa73ojg_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Dream_navigate_to');

                                                  context.pushNamed(
                                                    ViewDreamOtherWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'dreamView':
                                                          serializeParam(
                                                        listViewDreamsRecord,
                                                        ParamType.Document,
                                                      ),
                                                      'authorDocReference':
                                                          serializeParam(
                                                        dreamUsersRecord
                                                            ?.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'authorDoc':
                                                          serializeParam(
                                                        dreamUsersRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'dreamView':
                                                          listViewDreamsRecord,
                                                      'authorDoc':
                                                          dreamUsersRecord,
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
                                                  dreamDoc:
                                                      listViewDreamsRecord,
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
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: StreamBuilder<List<DreamsRecord>>(
                                stream: queryDreamsRecord(
                                  queryBuilder: (dreamsRecord) =>
                                      dreamsRecord.where(
                                    'isPublic',
                                    isEqualTo: true,
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
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
                                          listViewDreamsRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: StreamBuilder<List<UsersRecord>>(
                                          stream: queryUsersRecord(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord.where(
                                              'uid',
                                              isEqualTo:
                                                  listViewDreamsRecord.uid,
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
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DREAM_LIST_Container_q38m4kit_ON_TAP');
                                                logFirebaseEvent(
                                                    'Dream_navigate_to');

                                                context.pushNamed(
                                                  ViewDreamOtherWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'dreamView': serializeParam(
                                                      listViewDreamsRecord,
                                                      ParamType.Document,
                                                    ),
                                                    'authorDocReference':
                                                        serializeParam(
                                                      dreamUsersRecord
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'authorDoc': serializeParam(
                                                      dreamUsersRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'dreamView':
                                                        listViewDreamsRecord,
                                                    'authorDoc':
                                                        dreamUsersRecord,
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
                FlutterFlowAdBanner(
                  height: 50.0,
                  showsTestAd: true,
                  androidAdUnitID: 'ca-app-pub-8275745562074405/3884207984',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
