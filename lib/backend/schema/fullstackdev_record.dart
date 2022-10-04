import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'fullstackdev_record.g.dart';

abstract class FullstackdevRecord
    implements Built<FullstackdevRecord, FullstackdevRecordBuilder> {
  static Serializer<FullstackdevRecord> get serializer =>
      _$fullstackdevRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FullstackdevRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fullstackdev');

  static Stream<FullstackdevRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FullstackdevRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FullstackdevRecord._();
  factory FullstackdevRecord(
          [void Function(FullstackdevRecordBuilder) updates]) =
      _$FullstackdevRecord;

  static FullstackdevRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFullstackdevRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    FullstackdevRecord.serializer,
    FullstackdevRecord(
      (f) => f
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
