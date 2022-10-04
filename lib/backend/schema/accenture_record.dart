import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'accenture_record.g.dart';

abstract class AccentureRecord
    implements Built<AccentureRecord, AccentureRecordBuilder> {
  static Serializer<AccentureRecord> get serializer =>
      _$accentureRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AccentureRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('accenture');

  static Stream<AccentureRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AccentureRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AccentureRecord._();
  factory AccentureRecord([void Function(AccentureRecordBuilder) updates]) =
      _$AccentureRecord;

  static AccentureRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAccentureRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    AccentureRecord.serializer,
    AccentureRecord(
      (a) => a
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
