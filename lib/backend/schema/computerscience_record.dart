import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'computerscience_record.g.dart';

abstract class ComputerscienceRecord
    implements Built<ComputerscienceRecord, ComputerscienceRecordBuilder> {
  static Serializer<ComputerscienceRecord> get serializer =>
      _$computerscienceRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ComputerscienceRecordBuilder builder) =>
      builder
        ..id = 0
        ..title = ''
        ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('computerscience');

  static Stream<ComputerscienceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ComputerscienceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ComputerscienceRecord._();
  factory ComputerscienceRecord(
          [void Function(ComputerscienceRecordBuilder) updates]) =
      _$ComputerscienceRecord;

  static ComputerscienceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createComputerscienceRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    ComputerscienceRecord.serializer,
    ComputerscienceRecord(
      (c) => c
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
