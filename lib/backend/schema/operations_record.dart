import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'operations_record.g.dart';

abstract class OperationsRecord
    implements Built<OperationsRecord, OperationsRecordBuilder> {
  static Serializer<OperationsRecord> get serializer =>
      _$operationsRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OperationsRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('operations');

  static Stream<OperationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OperationsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OperationsRecord._();
  factory OperationsRecord([void Function(OperationsRecordBuilder) updates]) =
      _$OperationsRecord;

  static OperationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOperationsRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    OperationsRecord.serializer,
    OperationsRecord(
      (o) => o
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
