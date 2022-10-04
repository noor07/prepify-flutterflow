import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'softwarearchitect_record.g.dart';

abstract class SoftwarearchitectRecord
    implements Built<SoftwarearchitectRecord, SoftwarearchitectRecordBuilder> {
  static Serializer<SoftwarearchitectRecord> get serializer =>
      _$softwarearchitectRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SoftwarearchitectRecordBuilder builder) =>
      builder
        ..id = 0
        ..title = ''
        ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('softwarearchitect');

  static Stream<SoftwarearchitectRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SoftwarearchitectRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SoftwarearchitectRecord._();
  factory SoftwarearchitectRecord(
          [void Function(SoftwarearchitectRecordBuilder) updates]) =
      _$SoftwarearchitectRecord;

  static SoftwarearchitectRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSoftwarearchitectRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    SoftwarearchitectRecord.serializer,
    SoftwarearchitectRecord(
      (s) => s
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
