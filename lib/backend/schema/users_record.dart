import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "login_count" field.
  int? _loginCount;
  int get loginCount => _loginCount ?? 0;
  bool hasLoginCount() => _loginCount != null;

  // "nps" field.
  int? _nps;
  int get nps => _nps ?? 0;
  bool hasNps() => _nps != null;

  // "userTimezone" field.
  String? _userTimezone;
  String get userTimezone => _userTimezone ?? '';
  bool hasUserTimezone() => _userTimezone != null;

  // "numDreams" field.
  int? _numDreams;
  int get numDreams => _numDreams ?? 0;
  bool hasNumDreams() => _numDreams != null;

  // "wakeupTime" field.
  String? _wakeupTime;
  String get wakeupTime => _wakeupTime ?? '';
  bool hasWakeupTime() => _wakeupTime != null;

  // "bedTime" field.
  String? _bedTime;
  String get bedTime => _bedTime ?? '';
  bool hasBedTime() => _bedTime != null;

  // "following" field.
  List<String>? _following;
  List<String> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "followers" field.
  List<String>? _followers;
  List<String> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _loginCount = castToType<int>(snapshotData['login_count']);
    _nps = castToType<int>(snapshotData['nps']);
    _userTimezone = snapshotData['userTimezone'] as String?;
    _numDreams = castToType<int>(snapshotData['numDreams']);
    _wakeupTime = snapshotData['wakeupTime'] as String?;
    _bedTime = snapshotData['bedTime'] as String?;
    _following = getDataList(snapshotData['following']);
    _followers = getDataList(snapshotData['followers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? birthday,
  int? loginCount,
  int? nps,
  String? userTimezone,
  int? numDreams,
  String? wakeupTime,
  String? bedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'birthday': birthday,
      'login_count': loginCount,
      'nps': nps,
      'userTimezone': userTimezone,
      'numDreams': numDreams,
      'wakeupTime': wakeupTime,
      'bedTime': bedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.birthday == e2?.birthday &&
        e1?.loginCount == e2?.loginCount &&
        e1?.nps == e2?.nps &&
        e1?.userTimezone == e2?.userTimezone &&
        e1?.numDreams == e2?.numDreams &&
        e1?.wakeupTime == e2?.wakeupTime &&
        e1?.bedTime == e2?.bedTime &&
        listEquality.equals(e1?.following, e2?.following) &&
        listEquality.equals(e1?.followers, e2?.followers);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.birthday,
        e?.loginCount,
        e?.nps,
        e?.userTimezone,
        e?.numDreams,
        e?.wakeupTime,
        e?.bedTime,
        e?.following,
        e?.followers
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
