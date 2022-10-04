import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'amazon_record.g.dart';

abstract class AmazonRecord
    implements Built<AmazonRecord, AmazonRecordBuilder> {
  static Serializer<AmazonRecord> get serializer => _$amazonRecordSerializer;

  int? get id;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AmazonRecordBuilder builder) =>
      builder..id = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('amazon');

  static Stream<AmazonRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AmazonRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AmazonRecord._();
  factory AmazonRecord([void Function(AmazonRecordBuilder) updates]) =
      _$AmazonRecord;

  static AmazonRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAmazonRecordData({
  int? id,
}) {
  final firestoreData = serializers.toFirestore(
    AmazonRecord.serializer,
    AmazonRecord(
      (a) => a..id = id,
    ),
  );

  return firestoreData;
}
