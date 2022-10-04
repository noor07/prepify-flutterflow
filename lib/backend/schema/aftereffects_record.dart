import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'aftereffects_record.g.dart';

abstract class AftereffectsRecord
    implements Built<AftereffectsRecord, AftereffectsRecordBuilder> {
  static Serializer<AftereffectsRecord> get serializer =>
      _$aftereffectsRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AftereffectsRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('aftereffects');

  static Stream<AftereffectsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AftereffectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AftereffectsRecord._();
  factory AftereffectsRecord(
          [void Function(AftereffectsRecordBuilder) updates]) =
      _$AftereffectsRecord;

  static AftereffectsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAftereffectsRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    AftereffectsRecord.serializer,
    AftereffectsRecord(
      (a) => a
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
