import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'saleforce_record.g.dart';

abstract class SaleforceRecord
    implements Built<SaleforceRecord, SaleforceRecordBuilder> {
  static Serializer<SaleforceRecord> get serializer =>
      _$saleforceRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SaleforceRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('saleforce');

  static Stream<SaleforceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SaleforceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SaleforceRecord._();
  factory SaleforceRecord([void Function(SaleforceRecordBuilder) updates]) =
      _$SaleforceRecord;

  static SaleforceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSaleforceRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    SaleforceRecord.serializer,
    SaleforceRecord(
      (s) => s
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
