import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'net_record.g.dart';

abstract class NetRecord implements Built<NetRecord, NetRecordBuilder> {
  static Serializer<NetRecord> get serializer => _$netRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NetRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('net');

  static Stream<NetRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NetRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NetRecord._();
  factory NetRecord([void Function(NetRecordBuilder) updates]) = _$NetRecord;

  static NetRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNetRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    NetRecord.serializer,
    NetRecord(
      (n) => n
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
