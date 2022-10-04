import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'androidques_record.g.dart';

abstract class AndroidquesRecord
    implements Built<AndroidquesRecord, AndroidquesRecordBuilder> {
  static Serializer<AndroidquesRecord> get serializer =>
      _$androidquesRecordSerializer;

  String? get title;

  String? get answer;

  String? get id;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AndroidquesRecordBuilder builder) => builder
    ..title = ''
    ..answer = ''
    ..id = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('androidques');

  static Stream<AndroidquesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AndroidquesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AndroidquesRecord._();
  factory AndroidquesRecord([void Function(AndroidquesRecordBuilder) updates]) =
      _$AndroidquesRecord;

  static AndroidquesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAndroidquesRecordData({
  String? title,
  String? answer,
  String? id,
}) {
  final firestoreData = serializers.toFirestore(
    AndroidquesRecord.serializer,
    AndroidquesRecord(
      (a) => a
        ..title = title
        ..answer = answer
        ..id = id,
    ),
  );

  return firestoreData;
}
