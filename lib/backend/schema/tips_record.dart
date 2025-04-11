import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// This is the collection of tips you get in the app
class TipsRecord extends FirestoreRecord {
  TipsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  void _initializeFields() {
    _number = castToType<int>(snapshotData['number']);
    _content = snapshotData['content'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tips');

  static Stream<TipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TipsRecord.fromSnapshot(s));

  static Future<TipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TipsRecord.fromSnapshot(s));

  static TipsRecord fromSnapshot(DocumentSnapshot snapshot) => TipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTipsRecordData({
  int? number,
  String? content,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'number': number,
      'content': content,
    }.withoutNulls,
  );

  return firestoreData;
}

class TipsRecordDocumentEquality implements Equality<TipsRecord> {
  const TipsRecordDocumentEquality();

  @override
  bool equals(TipsRecord? e1, TipsRecord? e2) {
    return e1?.number == e2?.number && e1?.content == e2?.content;
  }

  @override
  int hash(TipsRecord? e) => const ListEquality().hash([e?.number, e?.content]);

  @override
  bool isValidKey(Object? o) => o is TipsRecord;
}
