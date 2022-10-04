import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'illustrator_record.g.dart';

abstract class IllustratorRecord
    implements Built<IllustratorRecord, IllustratorRecordBuilder> {
  static Serializer<IllustratorRecord> get serializer =>
      _$illustratorRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(IllustratorRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('illustrator');

  static Stream<IllustratorRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IllustratorRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IllustratorRecord._();
  factory IllustratorRecord([void Function(IllustratorRecordBuilder) updates]) =
      _$IllustratorRecord;

  static IllustratorRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIllustratorRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    IllustratorRecord.serializer,
    IllustratorRecord(
      (i) => i
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
