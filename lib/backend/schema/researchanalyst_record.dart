import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'researchanalyst_record.g.dart';

abstract class ResearchanalystRecord
    implements Built<ResearchanalystRecord, ResearchanalystRecordBuilder> {
  static Serializer<ResearchanalystRecord> get serializer =>
      _$researchanalystRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ResearchanalystRecordBuilder builder) =>
      builder
        ..id = 0
        ..title = ''
        ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('researchanalyst');

  static Stream<ResearchanalystRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ResearchanalystRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ResearchanalystRecord._();
  factory ResearchanalystRecord(
          [void Function(ResearchanalystRecordBuilder) updates]) =
      _$ResearchanalystRecord;

  static ResearchanalystRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createResearchanalystRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    ResearchanalystRecord.serializer,
    ResearchanalystRecord(
      (r) => r
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
