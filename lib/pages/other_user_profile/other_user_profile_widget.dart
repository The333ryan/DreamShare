import '/backend/backend.dart';
import '/components/dream/dream_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'other_user_profile_model.dart';
export 'other_user_profile_model.dart';

class OtherUserProfileWidget extends StatefulWidget {
  const OtherUserProfileWidget({
    super.key,
    required this.profileView,
  });

  final UsersRecord? profileView;

  static String routeName = 'OtherUserProfile';
  static String routePath = '/otherUserProfile';

  @override
  State<OtherUserProfileWidget> createState() => _OtherUserProfileWidgetState();
}

class _OtherUserProfileWidgetState extends State<OtherUserProfileWidget> {
  late OtherUserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtherUserProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OtherUserProfile'});
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
        body: Container(
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
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
                        Icons.arrow_back,
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
                            'OTHER_USER_PROFILE_arrow_back_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_to');

                        context.goNamed(DreamListWidget.routeName);
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.profileView!.photoUrl,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.profileView?.displayName,
                  'name',
                ),
                style: FlutterFlowTheme.of(context).displayLarge.override(
                      font: GoogleFonts.exo2(
                        fontWeight: FlutterFlowTheme.of(context)
                            .displayLarge
                            .fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).displayLarge.fontStyle,
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
                      fontWeight:
                          FlutterFlowTheme.of(context).displayLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).displayLarge.fontStyle,
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
                        Text(
                          valueOrDefault<String>(
                            widget.profileView?.following.length.toString(),
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
                      Text(
                        valueOrDefault<String>(
                          widget.profileView?.followers.length.toString(),
                          '0',
                        ),
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
              Flexible(
                child: StreamBuilder<List<DreamsRecord>>(
                  stream: queryDreamsRecord(
                    queryBuilder: (dreamsRecord) => dreamsRecord.where(
                      'display_name',
                      isEqualTo: widget.profileView?.displayName,
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
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<DreamsRecord> listViewDreamsRecordList =
                        snapshot.data!;

                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'OTHER_USER_PROFILE_ListView_cyybcfk7_ON_');
                        logFirebaseEvent('ListView_google_analytics_event');
                        logFirebaseEvent('Dream_On_Tap_Profile');
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewDreamsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewDreamsRecord =
                              listViewDreamsRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Container(
                              key: ValueKey('Dream_p4rs'),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'OTHER_USER_PROFILE_Container_oko485we_ON');
                                  logFirebaseEvent('Dream_navigate_to');

                                  context.pushNamed(
                                    ViewDreamUserWidget.routeName,
                                    queryParameters: {
                                      'dreamDoc': serializeParam(
                                        listViewDreamsRecord,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'dreamDoc': listViewDreamsRecord,
                                    },
                                  );

                                  logFirebaseEvent(
                                      'Dream_google_analytics_event');
                                  logFirebaseEvent(
                                      'View_Dream_User_Profile_On_tap');
                                },
                                child: DreamWidget(
                                  key: Key(
                                      'Keyoko_${listViewIndex}_of_${listViewDreamsRecordList.length}'),
                                  dreamDoc: listViewDreamsRecord,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ].divide(SizedBox(height: 10.0)).addToStart(SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
