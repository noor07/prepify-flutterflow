import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mechanical_record.g.dart';

abstract class MechanicalRecord
    implements Built<MechanicalRecord, MechanicalRecordBuilder> {
  static Serializer<MechanicalRecord> get serializer =>
      _$mechanicalRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MechanicalRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mechanical');

  static Stream<MechanicalRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MechanicalRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MechanicalRecord._();
  factory MechanicalRecord([void Function(MechanicalRecordBuilder) updates]) =
      _$MechanicalRecord;

  static MechanicalRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMechanicalRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    MechanicalRecord.serializer,
    MechanicalRecord(
      (m) => m
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
