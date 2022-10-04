import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'projectmanager_record.g.dart';

abstract class ProjectmanagerRecord
    implements Built<ProjectmanagerRecord, ProjectmanagerRecordBuilder> {
  static Serializer<ProjectmanagerRecord> get serializer =>
      _$projectmanagerRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProjectmanagerRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projectmanager');

  static Stream<ProjectmanagerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProjectmanagerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProjectmanagerRecord._();
  factory ProjectmanagerRecord(
          [void Function(ProjectmanagerRecordBuilder) updates]) =
      _$ProjectmanagerRecord;

  static ProjectmanagerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProjectmanagerRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    ProjectmanagerRecord.serializer,
    ProjectmanagerRecord(
      (p) => p
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
