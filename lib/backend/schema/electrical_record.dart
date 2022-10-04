import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'electrical_record.g.dart';

abstract class ElectricalRecord
    implements Built<ElectricalRecord, ElectricalRecordBuilder> {
  static Serializer<ElectricalRecord> get serializer =>
      _$electricalRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ElectricalRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('electrical');

  static Stream<ElectricalRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ElectricalRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ElectricalRecord._();
  factory ElectricalRecord([void Function(ElectricalRecordBuilder) updates]) =
      _$ElectricalRecord;

  static ElectricalRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createElectricalRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    ElectricalRecord.serializer,
    ElectricalRecord(
      (e) => e
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
