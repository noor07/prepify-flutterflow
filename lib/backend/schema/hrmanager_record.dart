import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'hrmanager_record.g.dart';

abstract class HrmanagerRecord
    implements Built<HrmanagerRecord, HrmanagerRecordBuilder> {
  static Serializer<HrmanagerRecord> get serializer =>
      _$hrmanagerRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(HrmanagerRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hrmanager');

  static Stream<HrmanagerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<HrmanagerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  HrmanagerRecord._();
  factory HrmanagerRecord([void Function(HrmanagerRecordBuilder) updates]) =
      _$HrmanagerRecord;

  static HrmanagerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createHrmanagerRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    HrmanagerRecord.serializer,
    HrmanagerRecord(
      (h) => h
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
