import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'blender_record.g.dart';

abstract class BlenderRecord
    implements Built<BlenderRecord, BlenderRecordBuilder> {
  static Serializer<BlenderRecord> get serializer => _$blenderRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BlenderRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blender');

  static Stream<BlenderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BlenderRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BlenderRecord._();
  factory BlenderRecord([void Function(BlenderRecordBuilder) updates]) =
      _$BlenderRecord;

  static BlenderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBlenderRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    BlenderRecord.serializer,
    BlenderRecord(
      (b) => b
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
