import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chashques_record.g.dart';

abstract class ChashquesRecord
    implements Built<ChashquesRecord, ChashquesRecordBuilder> {
  static Serializer<ChashquesRecord> get serializer =>
      _$chashquesRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChashquesRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chashques');

  static Stream<ChashquesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChashquesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChashquesRecord._();
  factory ChashquesRecord([void Function(ChashquesRecordBuilder) updates]) =
      _$ChashquesRecord;

  static ChashquesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChashquesRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    ChashquesRecord.serializer,
    ChashquesRecord(
      (c) => c
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
