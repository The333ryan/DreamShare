import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DreamsRecord extends FirestoreRecord {
  DreamsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dreamTitle" field.
  String? _dreamTitle;
  String get dreamTitle => _dreamTitle ?? '';
  bool hasDreamTitle() => _dreamTitle != null;

  // "dreamDescription" field.
  String? _dreamDescription;
  String get dreamDescription => _dreamDescription ?? '';
  bool hasDreamDescription() => _dreamDescription != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "comments" field.
  DocumentReference? _comments;
  DocumentReference? get comments => _comments;
  bool hasComments() => _comments != null;

  // "isPublic" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  void _initializeFields() {
    _dreamTitle = snapshotData['dreamTitle'] as String?;
    _dreamDescription = snapshotData['dreamDescription'] as String?;
    _uid = snapshotData['uid'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _comments = snapshotData['comments'] as DocumentReference?;
    _isPublic = snapshotData['isPublic'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dreams');

  static Stream<DreamsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DreamsRecord.fromSnapshot(s));

  static Future<DreamsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DreamsRecord.fromSnapshot(s));

  static DreamsRecord fromSnapshot(DocumentSnapshot snapshot) => DreamsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DreamsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DreamsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DreamsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DreamsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDreamsRecordData({
  String? dreamTitle,
  String? dreamDescription,
  String? uid,
  DateTime? date,
  String? photoUrl,
  String? displayName,
  DocumentReference? comments,
  bool? isPublic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dreamTitle': dreamTitle,
      'dreamDescription': dreamDescription,
      'uid': uid,
      'date': date,
      'photo_url': photoUrl,
      'display_name': displayName,
      'comments': comments,
      'isPublic': isPublic,
    }.withoutNulls,
  );

  return firestoreData;
}

class DreamsRecordDocumentEquality implements Equality<DreamsRecord> {
  const DreamsRecordDocumentEquality();

  @override
  bool equals(DreamsRecord? e1, DreamsRecord? e2) {
    return e1?.dreamTitle == e2?.dreamTitle &&
        e1?.dreamDescription == e2?.dreamDescription &&
        e1?.uid == e2?.uid &&
        e1?.date == e2?.date &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.displayName == e2?.displayName &&
        e1?.comments == e2?.comments &&
        e1?.isPublic == e2?.isPublic;
  }

  @override
  int hash(DreamsRecord? e) => const ListEquality().hash([
        e?.dreamTitle,
        e?.dreamDescription,
        e?.uid,
        e?.date,
        e?.photoUrl,
        e?.displayName,
        e?.comments,
        e?.isPublic
      ]);

  @override
  bool isValidKey(Object? o) => o is DreamsRecord;
}
