import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'expques_record.g.dart';

abstract class ExpquesRecord
    implements Built<ExpquesRecord, ExpquesRecordBuilder> {
  static Serializer<ExpquesRecord> get serializer => _$expquesRecordSerializer;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ExpquesRecordBuilder builder) => builder
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('expques');

  static Stream<ExpquesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ExpquesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ExpquesRecord._();
  factory ExpquesRecord([void Function(ExpquesRecordBuilder) updates]) =
      _$ExpquesRecord;

  static ExpquesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createExpquesRecordData({
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    ExpquesRecord.serializer,
    ExpquesRecord(
      (e) => e
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
