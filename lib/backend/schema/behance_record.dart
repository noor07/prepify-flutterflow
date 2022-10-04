import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'behance_record.g.dart';

abstract class BehanceRecord
    implements Built<BehanceRecord, BehanceRecordBuilder> {
  static Serializer<BehanceRecord> get serializer => _$behanceRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BehanceRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('behance');

  static Stream<BehanceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BehanceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BehanceRecord._();
  factory BehanceRecord([void Function(BehanceRecordBuilder) updates]) =
      _$BehanceRecord;

  static BehanceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBehanceRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    BehanceRecord.serializer,
    BehanceRecord(
      (b) => b
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
