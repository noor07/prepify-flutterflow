import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'dataanalyst_record.g.dart';

abstract class DataanalystRecord
    implements Built<DataanalystRecord, DataanalystRecordBuilder> {
  static Serializer<DataanalystRecord> get serializer =>
      _$dataanalystRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DataanalystRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dataanalyst');

  static Stream<DataanalystRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DataanalystRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DataanalystRecord._();
  factory DataanalystRecord([void Function(DataanalystRecordBuilder) updates]) =
      _$DataanalystRecord;

  static DataanalystRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDataanalystRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    DataanalystRecord.serializer,
    DataanalystRecord(
      (d) => d
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
