import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'systemsecurity_record.g.dart';

abstract class SystemsecurityRecord
    implements Built<SystemsecurityRecord, SystemsecurityRecordBuilder> {
  static Serializer<SystemsecurityRecord> get serializer =>
      _$systemsecurityRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SystemsecurityRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('systemsecurity');

  static Stream<SystemsecurityRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SystemsecurityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SystemsecurityRecord._();
  factory SystemsecurityRecord(
          [void Function(SystemsecurityRecordBuilder) updates]) =
      _$SystemsecurityRecord;

  static SystemsecurityRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSystemsecurityRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    SystemsecurityRecord.serializer,
    SystemsecurityRecord(
      (s) => s
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
