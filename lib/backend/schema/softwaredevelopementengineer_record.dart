import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'softwaredevelopementengineer_record.g.dart';

abstract class SoftwaredevelopementengineerRecord
    implements
        Built<SoftwaredevelopementengineerRecord,
            SoftwaredevelopementengineerRecordBuilder> {
  static Serializer<SoftwaredevelopementengineerRecord> get serializer =>
      _$softwaredevelopementengineerRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(
          SoftwaredevelopementengineerRecordBuilder builder) =>
      builder
        ..id = 0
        ..title = ''
        ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('softwaredevelopementengineer');

  static Stream<SoftwaredevelopementengineerRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SoftwaredevelopementengineerRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SoftwaredevelopementengineerRecord._();
  factory SoftwaredevelopementengineerRecord(
          [void Function(SoftwaredevelopementengineerRecordBuilder) updates]) =
      _$SoftwaredevelopementengineerRecord;

  static SoftwaredevelopementengineerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSoftwaredevelopementengineerRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    SoftwaredevelopementengineerRecord.serializer,
    SoftwaredevelopementengineerRecord(
      (s) => s
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
