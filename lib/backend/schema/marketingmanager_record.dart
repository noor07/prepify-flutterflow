import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'marketingmanager_record.g.dart';

abstract class MarketingmanagerRecord
    implements Built<MarketingmanagerRecord, MarketingmanagerRecordBuilder> {
  static Serializer<MarketingmanagerRecord> get serializer =>
      _$marketingmanagerRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MarketingmanagerRecordBuilder builder) =>
      builder
        ..id = 0
        ..title = ''
        ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('marketingmanager');

  static Stream<MarketingmanagerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MarketingmanagerRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MarketingmanagerRecord._();
  factory MarketingmanagerRecord(
          [void Function(MarketingmanagerRecordBuilder) updates]) =
      _$MarketingmanagerRecord;

  static MarketingmanagerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMarketingmanagerRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    MarketingmanagerRecord.serializer,
    MarketingmanagerRecord(
      (m) => m
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
