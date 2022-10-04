import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tensorflow_record.g.dart';

abstract class TensorflowRecord
    implements Built<TensorflowRecord, TensorflowRecordBuilder> {
  static Serializer<TensorflowRecord> get serializer =>
      _$tensorflowRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TensorflowRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tensorflow');

  static Stream<TensorflowRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TensorflowRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TensorflowRecord._();
  factory TensorflowRecord([void Function(TensorflowRecordBuilder) updates]) =
      _$TensorflowRecord;

  static TensorflowRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTensorflowRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    TensorflowRecord.serializer,
    TensorflowRecord(
      (t) => t
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
