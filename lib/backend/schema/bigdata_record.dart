import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bigdata_record.g.dart';

abstract class BigdataRecord
    implements Built<BigdataRecord, BigdataRecordBuilder> {
  static Serializer<BigdataRecord> get serializer => _$bigdataRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BigdataRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bigdata');

  static Stream<BigdataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BigdataRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BigdataRecord._();
  factory BigdataRecord([void Function(BigdataRecordBuilder) updates]) =
      _$BigdataRecord;

  static BigdataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBigdataRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    BigdataRecord.serializer,
    BigdataRecord(
      (b) => b
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
