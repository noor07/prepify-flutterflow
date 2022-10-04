import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'nodejs_record.g.dart';

abstract class NodejsRecord
    implements Built<NodejsRecord, NodejsRecordBuilder> {
  static Serializer<NodejsRecord> get serializer => _$nodejsRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NodejsRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nodejs');

  static Stream<NodejsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NodejsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NodejsRecord._();
  factory NodejsRecord([void Function(NodejsRecordBuilder) updates]) =
      _$NodejsRecord;

  static NodejsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNodejsRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    NodejsRecord.serializer,
    NodejsRecord(
      (n) => n
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
