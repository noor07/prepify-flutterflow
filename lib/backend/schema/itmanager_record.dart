import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'itmanager_record.g.dart';

abstract class ItmanagerRecord
    implements Built<ItmanagerRecord, ItmanagerRecordBuilder> {
  static Serializer<ItmanagerRecord> get serializer =>
      _$itmanagerRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ItmanagerRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('itmanager');

  static Stream<ItmanagerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ItmanagerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ItmanagerRecord._();
  factory ItmanagerRecord([void Function(ItmanagerRecordBuilder) updates]) =
      _$ItmanagerRecord;

  static ItmanagerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createItmanagerRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    ItmanagerRecord.serializer,
    ItmanagerRecord(
      (i) => i
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
