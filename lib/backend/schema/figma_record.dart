import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'figma_record.g.dart';

abstract class FigmaRecord implements Built<FigmaRecord, FigmaRecordBuilder> {
  static Serializer<FigmaRecord> get serializer => _$figmaRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FigmaRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('figma');

  static Stream<FigmaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FigmaRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FigmaRecord._();
  factory FigmaRecord([void Function(FigmaRecordBuilder) updates]) =
      _$FigmaRecord;

  static FigmaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFigmaRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    FigmaRecord.serializer,
    FigmaRecord(
      (f) => f
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
