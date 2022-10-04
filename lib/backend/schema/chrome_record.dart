import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chrome_record.g.dart';

abstract class ChromeRecord
    implements Built<ChromeRecord, ChromeRecordBuilder> {
  static Serializer<ChromeRecord> get serializer => _$chromeRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChromeRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chrome');

  static Stream<ChromeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChromeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChromeRecord._();
  factory ChromeRecord([void Function(ChromeRecordBuilder) updates]) =
      _$ChromeRecord;

  static ChromeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChromeRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    ChromeRecord.serializer,
    ChromeRecord(
      (c) => c
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
