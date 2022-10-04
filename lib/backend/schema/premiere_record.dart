import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'premiere_record.g.dart';

abstract class PremiereRecord
    implements Built<PremiereRecord, PremiereRecordBuilder> {
  static Serializer<PremiereRecord> get serializer =>
      _$premiereRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PremiereRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('premiere');

  static Stream<PremiereRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PremiereRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PremiereRecord._();
  factory PremiereRecord([void Function(PremiereRecordBuilder) updates]) =
      _$PremiereRecord;

  static PremiereRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPremiereRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    PremiereRecord.serializer,
    PremiereRecord(
      (p) => p
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
