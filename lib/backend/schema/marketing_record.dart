import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'marketing_record.g.dart';

abstract class MarketingRecord
    implements Built<MarketingRecord, MarketingRecordBuilder> {
  static Serializer<MarketingRecord> get serializer =>
      _$marketingRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MarketingRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('marketing');

  static Stream<MarketingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MarketingRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MarketingRecord._();
  factory MarketingRecord([void Function(MarketingRecordBuilder) updates]) =
      _$MarketingRecord;

  static MarketingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMarketingRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    MarketingRecord.serializer,
    MarketingRecord(
      (m) => m
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
