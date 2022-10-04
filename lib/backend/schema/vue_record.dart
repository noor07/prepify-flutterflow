import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'vue_record.g.dart';

abstract class VueRecord implements Built<VueRecord, VueRecordBuilder> {
  static Serializer<VueRecord> get serializer => _$vueRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VueRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vue');

  static Stream<VueRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VueRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VueRecord._();
  factory VueRecord([void Function(VueRecordBuilder) updates]) = _$VueRecord;

  static VueRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVueRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    VueRecord.serializer,
    VueRecord(
      (v) => v
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
