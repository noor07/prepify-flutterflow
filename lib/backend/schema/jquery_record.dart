import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'jquery_record.g.dart';

abstract class JqueryRecord
    implements Built<JqueryRecord, JqueryRecordBuilder> {
  static Serializer<JqueryRecord> get serializer => _$jqueryRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(JqueryRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jquery');

  static Stream<JqueryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JqueryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JqueryRecord._();
  factory JqueryRecord([void Function(JqueryRecordBuilder) updates]) =
      _$JqueryRecord;

  static JqueryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJqueryRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    JqueryRecord.serializer,
    JqueryRecord(
      (j) => j
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
