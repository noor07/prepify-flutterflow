import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'productmanager_record.g.dart';

abstract class ProductmanagerRecord
    implements Built<ProductmanagerRecord, ProductmanagerRecordBuilder> {
  static Serializer<ProductmanagerRecord> get serializer =>
      _$productmanagerRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductmanagerRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('productmanager');

  static Stream<ProductmanagerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductmanagerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProductmanagerRecord._();
  factory ProductmanagerRecord(
          [void Function(ProductmanagerRecordBuilder) updates]) =
      _$ProductmanagerRecord;

  static ProductmanagerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductmanagerRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    ProductmanagerRecord.serializer,
    ProductmanagerRecord(
      (p) => p
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
