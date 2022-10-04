import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'fresherques_record.g.dart';

abstract class FresherquesRecord
    implements Built<FresherquesRecord, FresherquesRecordBuilder> {
  static Serializer<FresherquesRecord> get serializer =>
      _$fresherquesRecordSerializer;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FresherquesRecordBuilder builder) => builder
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fresherques');

  static Stream<FresherquesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FresherquesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FresherquesRecord._();
  factory FresherquesRecord([void Function(FresherquesRecordBuilder) updates]) =
      _$FresherquesRecord;

  static FresherquesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFresherquesRecordData({
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    FresherquesRecord.serializer,
    FresherquesRecord(
      (f) => f
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
