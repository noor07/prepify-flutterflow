import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'financialanalyst_record.g.dart';

abstract class FinancialanalystRecord
    implements Built<FinancialanalystRecord, FinancialanalystRecordBuilder> {
  static Serializer<FinancialanalystRecord> get serializer =>
      _$financialanalystRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FinancialanalystRecordBuilder builder) =>
      builder
        ..id = 0
        ..title = ''
        ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('financialanalyst');

  static Stream<FinancialanalystRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FinancialanalystRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FinancialanalystRecord._();
  factory FinancialanalystRecord(
          [void Function(FinancialanalystRecordBuilder) updates]) =
      _$FinancialanalystRecord;

  static FinancialanalystRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFinancialanalystRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    FinancialanalystRecord.serializer,
    FinancialanalystRecord(
      (f) => f
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
