import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'kotlin_record.g.dart';

abstract class KotlinRecord
    implements Built<KotlinRecord, KotlinRecordBuilder> {
  static Serializer<KotlinRecord> get serializer => _$kotlinRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(KotlinRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kotlin');

  static Stream<KotlinRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<KotlinRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  KotlinRecord._();
  factory KotlinRecord([void Function(KotlinRecordBuilder) updates]) =
      _$KotlinRecord;

  static KotlinRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createKotlinRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    KotlinRecord.serializer,
    KotlinRecord(
      (k) => k
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
