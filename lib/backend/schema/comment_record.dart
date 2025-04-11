import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentRecord extends FirestoreRecord {
  CommentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dreamDate" field.
  DateTime? _dreamDate;
  DateTime? get dreamDate => _dreamDate;
  bool hasDreamDate() => _dreamDate != null;

  // "dreamTitle" field.
  String? _dreamTitle;
  String get dreamTitle => _dreamTitle ?? '';
  bool hasDreamTitle() => _dreamTitle != null;

  // "commentText" field.
  String? _commentText;
  String get commentText => _commentText ?? '';
  bool hasCommentText() => _commentText != null;

  // "uidPost" field.
  String? _uidPost;
  String get uidPost => _uidPost ?? '';
  bool hasUidPost() => _uidPost != null;

  // "uidComment" field.
  String? _uidComment;
  String get uidComment => _uidComment ?? '';
  bool hasUidComment() => _uidComment != null;

  // "profilePicture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  bool hasProfilePicture() => _profilePicture != null;

  // "dateCommented" field.
  DateTime? _dateCommented;
  DateTime? get dateCommented => _dateCommented;
  bool hasDateCommented() => _dateCommented != null;

  // "authorUsername" field.
  String? _authorUsername;
  String get authorUsername => _authorUsername ?? '';
  bool hasAuthorUsername() => _authorUsername != null;

  void _initializeFields() {
    _dreamDate = snapshotData['dreamDate'] as DateTime?;
    _dreamTitle = snapshotData['dreamTitle'] as String?;
    _commentText = snapshotData['commentText'] as String?;
    _uidPost = snapshotData['uidPost'] as String?;
    _uidComment = snapshotData['uidComment'] as String?;
    _profilePicture = snapshotData['profilePicture'] as String?;
    _dateCommented = snapshotData['dateCommented'] as DateTime?;
    _authorUsername = snapshotData['authorUsername'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comment');

  static Stream<CommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentRecord.fromSnapshot(s));

  static Future<CommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentRecord.fromSnapshot(s));

  static CommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentRecordData({
  DateTime? dreamDate,
  String? dreamTitle,
  String? commentText,
  String? uidPost,
  String? uidComment,
  String? profilePicture,
  DateTime? dateCommented,
  String? authorUsername,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dreamDate': dreamDate,
      'dreamTitle': dreamTitle,
      'commentText': commentText,
      'uidPost': uidPost,
      'uidComment': uidComment,
      'profilePicture': profilePicture,
      'dateCommented': dateCommented,
      'authorUsername': authorUsername,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentRecordDocumentEquality implements Equality<CommentRecord> {
  const CommentRecordDocumentEquality();

  @override
  bool equals(CommentRecord? e1, CommentRecord? e2) {
    return e1?.dreamDate == e2?.dreamDate &&
        e1?.dreamTitle == e2?.dreamTitle &&
        e1?.commentText == e2?.commentText &&
        e1?.uidPost == e2?.uidPost &&
        e1?.uidComment == e2?.uidComment &&
        e1?.profilePicture == e2?.profilePicture &&
        e1?.dateCommented == e2?.dateCommented &&
        e1?.authorUsername == e2?.authorUsername;
  }

  @override
  int hash(CommentRecord? e) => const ListEquality().hash([
        e?.dreamDate,
        e?.dreamTitle,
        e?.commentText,
        e?.uidPost,
        e?.uidComment,
        e?.profilePicture,
        e?.dateCommented,
        e?.authorUsername
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentRecord;
}
