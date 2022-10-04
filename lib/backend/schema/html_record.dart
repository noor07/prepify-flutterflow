import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'html_record.g.dart';

abstract class HtmlRecord implements Built<HtmlRecord, HtmlRecordBuilder> {
  static Serializer<HtmlRecord> get serializer => _$htmlRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(HtmlRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('html');

  static Stream<HtmlRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<HtmlRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  HtmlRecord._();
  factory HtmlRecord([void Function(HtmlRecordBuilder) updates]) = _$HtmlRecord;

  static HtmlRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createHtmlRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    HtmlRecord.serializer,
    HtmlRecord(
      (h) => h
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
