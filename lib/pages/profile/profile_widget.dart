import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dream/dream_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  static String routeName = 'Profile';
  static String routePath = '/profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with TickerProviderStateMixin {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Profile'});
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
          onPressed: () async {
            logFirebaseEvent('PROFILE_FloatingActionButton_p01jalhz_ON');
            logFirebaseEvent('FloatingActionButton_navigate_to');

            context.pushNamed(AddDreamWidget.routeName);

            logFirebaseEvent('FloatingActionButton_google_analytics_ev');
            logFirebaseEvent(
              'Add_Dream_On_Tap_Profile',
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
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: valueOrDefault<Color>(
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
                      icon: Icon(
                        Icons.settings_sharp,
                        color: valueOrDefault<Color>(
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
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'PROFILE_PAGE_settings_sharp_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed(SettingsWidget.routeName);
                      },
                    ),
                  ),
                ],
              ),
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  shape: BoxShape.circle,
                ),
                child: AuthUserStreamWidget(
                  builder: (context) => ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      currentUserPhoto,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              AuthUserStreamWidget(
                builder: (context) => Text(
                  currentUserDisplayName,
                  style: FlutterFlowTheme.of(context).displayLarge.override(
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
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                          Color(0xFFAACCFF),
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .displayLarge
                            .fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).displayLarge.fontStyle,
                      ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault<String>(
                              (currentUserDocument?.following.toList() ?? [])
                                  .length
                                  .toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.exo2(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Text(
                          'Following',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.exo2(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          valueOrDefault<String>(
                            (currentUserDocument?.followers.toList() ?? [])
                                .length
                                .toString(),
                            '0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.exo2(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Text(
                        'Followers',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.exo2(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(width: 50.0)),
              ),
              Text(
                'Recent Posts',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: FlutterFlowTheme.of(context).bodyLarge,
                      letterSpacing: 0.0,
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
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                          Color(0xFFAACCFF),
                        ),
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              font: FlutterFlowTheme.of(context).titleMedium,
                              letterSpacing: 0.0,
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
                            text: 'Public',
                          ),
                          Tab(
                            text: 'Private',
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
                                child: StreamBuilder<List<DreamsRecord>>(
                                  stream: queryDreamsRecord(
                                    queryBuilder: (dreamsRecord) => dreamsRecord
                                        .where(
                                          'uid',
                                          isEqualTo: currentUserUid,
                                        )
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

                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PROFILE_PAGE_ListView_gmoz16jo_ON_TAP');
                                        logFirebaseEvent(
                                            'ListView_google_analytics_event');
                                        logFirebaseEvent(
                                            'Dream_On_Tap_Profile');
                                      },
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewDreamsRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewDreamsRecord =
                                              listViewDreamsRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PROFILE_PAGE_Container_j8n9pmwj_ON_TAP');
                                                logFirebaseEvent(
                                                    'Dream_navigate_to');

                                                context.pushNamed(
                                                  ViewDreamUserWidget.routeName,
                                                  queryParameters: {
                                                    'dreamDoc': serializeParam(
                                                      listViewDreamsRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'dreamDoc':
                                                        listViewDreamsRecord,
                                                  },
                                                );

                                                logFirebaseEvent(
                                                    'Dream_google_analytics_event');
                                                logFirebaseEvent(
                                                    'View_Dream_User_Profile_On_tap');
                                              },
                                              child: DreamWidget(
                                                key: Key(
                                                    'Keyj8n_${listViewIndex}_of_${listViewDreamsRecordList.length}'),
                                                dreamDoc: listViewDreamsRecord,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: StreamBuilder<List<DreamsRecord>>(
                                  stream: queryDreamsRecord(
                                    queryBuilder: (dreamsRecord) => dreamsRecord
                                        .where(
                                          'uid',
                                          isEqualTo: currentUserUid,
                                        )
                                        .where(
                                          'isPublic',
                                          isEqualTo: false,
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

                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PROFILE_PAGE_ListView_esqooxa0_ON_TAP');
                                        logFirebaseEvent(
                                            'ListView_google_analytics_event');
                                        logFirebaseEvent(
                                            'Dream_On_Tap_Profile');
                                      },
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewDreamsRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewDreamsRecord =
                                              listViewDreamsRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PROFILE_PAGE_Container_jrhpf7jb_ON_TAP');
                                                logFirebaseEvent(
                                                    'Dream_navigate_to');

                                                context.pushNamed(
                                                  ViewDreamUserWidget.routeName,
                                                  queryParameters: {
                                                    'dreamDoc': serializeParam(
                                                      listViewDreamsRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'dreamDoc':
                                                        listViewDreamsRecord,
                                                  },
                                                );

                                                logFirebaseEvent(
                                                    'Dream_google_analytics_event');
                                                logFirebaseEvent(
                                                    'View_Dream_User_Profile_On_tap');
                                              },
                                              child: DreamWidget(
                                                key: Key(
                                                    'Keyjrh_${listViewIndex}_of_${listViewDreamsRecordList.length}'),
                                                dreamDoc: listViewDreamsRecord,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
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
            ].divide(SizedBox(height: 10.0)).addToStart(SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
