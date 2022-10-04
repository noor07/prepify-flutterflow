import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bootstarpques_record.g.dart';

abstract class BootstarpquesRecord
    implements Built<BootstarpquesRecord, BootstarpquesRecordBuilder> {
  static Serializer<BootstarpquesRecord> get serializer =>
      _$bootstarpquesRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BootstarpquesRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bootstarpques');

  static Stream<BootstarpquesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BootstarpquesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BootstarpquesRecord._();
  factory BootstarpquesRecord(
          [void Function(BootstarpquesRecordBuilder) updates]) =
      _$BootstarpquesRecord;

  static BootstarpquesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBootstarpquesRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    BootstarpquesRecord.serializer,
    BootstarpquesRecord(
      (b) => b
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
