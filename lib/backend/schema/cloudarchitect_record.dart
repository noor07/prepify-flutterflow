import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cloudarchitect_record.g.dart';

abstract class CloudarchitectRecord
    implements Built<CloudarchitectRecord, CloudarchitectRecordBuilder> {
  static Serializer<CloudarchitectRecord> get serializer =>
      _$cloudarchitectRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CloudarchitectRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cloudarchitect');

  static Stream<CloudarchitectRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CloudarchitectRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CloudarchitectRecord._();
  factory CloudarchitectRecord(
          [void Function(CloudarchitectRecordBuilder) updates]) =
      _$CloudarchitectRecord;

  static CloudarchitectRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCloudarchitectRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    CloudarchitectRecord.serializer,
    CloudarchitectRecord(
      (c) => c
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
