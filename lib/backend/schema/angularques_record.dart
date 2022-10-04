import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'angularques_record.g.dart';

abstract class AngularquesRecord
    implements Built<AngularquesRecord, AngularquesRecordBuilder> {
  static Serializer<AngularquesRecord> get serializer =>
      _$angularquesRecordSerializer;

  String? get title;

  String? get answer;

  int? get id;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AngularquesRecordBuilder builder) => builder
    ..title = ''
    ..answer = ''
    ..id = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('angularques');

  static Stream<AngularquesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AngularquesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AngularquesRecord._();
  factory AngularquesRecord([void Function(AngularquesRecordBuilder) updates]) =
      _$AngularquesRecord;

  static AngularquesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAngularquesRecordData({
  String? title,
  String? answer,
  int? id,
}) {
  final firestoreData = serializers.toFirestore(
    AngularquesRecord.serializer,
    AngularquesRecord(
      (a) => a
        ..title = title
        ..answer = answer
        ..id = id,
    ),
  );

  return firestoreData;
}
