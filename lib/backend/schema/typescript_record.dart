import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'typescript_record.g.dart';

abstract class TypescriptRecord
    implements Built<TypescriptRecord, TypescriptRecordBuilder> {
  static Serializer<TypescriptRecord> get serializer =>
      _$typescriptRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TypescriptRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('typescript');

  static Stream<TypescriptRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TypescriptRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TypescriptRecord._();
  factory TypescriptRecord([void Function(TypescriptRecordBuilder) updates]) =
      _$TypescriptRecord;

  static TypescriptRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTypescriptRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    TypescriptRecord.serializer,
    TypescriptRecord(
      (t) => t
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
