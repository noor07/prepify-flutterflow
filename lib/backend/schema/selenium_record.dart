import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'selenium_record.g.dart';

abstract class SeleniumRecord
    implements Built<SeleniumRecord, SeleniumRecordBuilder> {
  static Serializer<SeleniumRecord> get serializer =>
      _$seleniumRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SeleniumRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('selenium');

  static Stream<SeleniumRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SeleniumRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SeleniumRecord._();
  factory SeleniumRecord([void Function(SeleniumRecordBuilder) updates]) =
      _$SeleniumRecord;

  static SeleniumRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSeleniumRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    SeleniumRecord.serializer,
    SeleniumRecord(
      (s) => s
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
