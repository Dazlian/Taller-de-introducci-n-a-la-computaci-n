import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TareasRecord extends FirestoreRecord {
  TareasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "task" field.
  String? _task;
  String get task => _task ?? '';
  bool hasTask() => _task != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "DatePicked" field.
  DateTime? _datePicked;
  DateTime? get datePicked => _datePicked;
  bool hasDatePicked() => _datePicked != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "notification_uuid" field.
  String? _notificationUuid;
  String get notificationUuid => _notificationUuid ?? '';
  bool hasNotificationUuid() => _notificationUuid != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  void _initializeFields() {
    _task = snapshotData['task'] as String?;
    _description = snapshotData['description'] as String?;
    _datePicked = snapshotData['DatePicked'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _notificationUuid = snapshotData['notification_uuid'] as String?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tareas');

  static Stream<TareasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TareasRecord.fromSnapshot(s));

  static Future<TareasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TareasRecord.fromSnapshot(s));

  static TareasRecord fromSnapshot(DocumentSnapshot snapshot) => TareasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TareasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TareasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TareasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TareasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTareasRecordData({
  String? task,
  String? description,
  DateTime? datePicked,
  String? uid,
  String? notificationUuid,
  bool? isCompleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'task': task,
      'description': description,
      'DatePicked': datePicked,
      'uid': uid,
      'notification_uuid': notificationUuid,
      'isCompleted': isCompleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class TareasRecordDocumentEquality implements Equality<TareasRecord> {
  const TareasRecordDocumentEquality();

  @override
  bool equals(TareasRecord? e1, TareasRecord? e2) {
    return e1?.task == e2?.task &&
        e1?.description == e2?.description &&
        e1?.datePicked == e2?.datePicked &&
        e1?.uid == e2?.uid &&
        e1?.notificationUuid == e2?.notificationUuid &&
        e1?.isCompleted == e2?.isCompleted;
  }

  @override
  int hash(TareasRecord? e) => const ListEquality().hash([
        e?.task,
        e?.description,
        e?.datePicked,
        e?.uid,
        e?.notificationUuid,
        e?.isCompleted
      ]);

  @override
  bool isValidKey(Object? o) => o is TareasRecord;
}
