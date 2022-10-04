import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chemical_record.g.dart';

abstract class ChemicalRecord
    implements Built<ChemicalRecord, ChemicalRecordBuilder> {
  static Serializer<ChemicalRecord> get serializer =>
      _$chemicalRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChemicalRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chemical');

  static Stream<ChemicalRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChemicalRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChemicalRecord._();
  factory ChemicalRecord([void Function(ChemicalRecordBuilder) updates]) =
      _$ChemicalRecord;

  static ChemicalRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChemicalRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    ChemicalRecord.serializer,
    ChemicalRecord(
      (c) => c
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
