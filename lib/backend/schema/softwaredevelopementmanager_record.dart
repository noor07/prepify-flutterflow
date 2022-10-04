import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'softwaredevelopementmanager_record.g.dart';

abstract class SoftwaredevelopementmanagerRecord
    implements
        Built<SoftwaredevelopementmanagerRecord,
            SoftwaredevelopementmanagerRecordBuilder> {
  static Serializer<SoftwaredevelopementmanagerRecord> get serializer =>
      _$softwaredevelopementmanagerRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(
          SoftwaredevelopementmanagerRecordBuilder builder) =>
      builder
        ..id = 0
        ..title = ''
        ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('softwaredevelopementmanager');

  static Stream<SoftwaredevelopementmanagerRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SoftwaredevelopementmanagerRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SoftwaredevelopementmanagerRecord._();
  factory SoftwaredevelopementmanagerRecord(
          [void Function(SoftwaredevelopementmanagerRecordBuilder) updates]) =
      _$SoftwaredevelopementmanagerRecord;

  static SoftwaredevelopementmanagerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSoftwaredevelopementmanagerRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    SoftwaredevelopementmanagerRecord.serializer,
    SoftwaredevelopementmanagerRecord(
      (s) => s
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
