import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'datascientist_record.g.dart';

abstract class DatascientistRecord
    implements Built<DatascientistRecord, DatascientistRecordBuilder> {
  static Serializer<DatascientistRecord> get serializer =>
      _$datascientistRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DatascientistRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('datascientist');

  static Stream<DatascientistRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DatascientistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DatascientistRecord._();
  factory DatascientistRecord(
          [void Function(DatascientistRecordBuilder) updates]) =
      _$DatascientistRecord;

  static DatascientistRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDatascientistRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    DatascientistRecord.serializer,
    DatascientistRecord(
      (d) => d
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
