import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'blockchain_record.g.dart';

abstract class BlockchainRecord
    implements Built<BlockchainRecord, BlockchainRecordBuilder> {
  static Serializer<BlockchainRecord> get serializer =>
      _$blockchainRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BlockchainRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blockchain');

  static Stream<BlockchainRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BlockchainRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BlockchainRecord._();
  factory BlockchainRecord([void Function(BlockchainRecordBuilder) updates]) =
      _$BlockchainRecord;

  static BlockchainRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBlockchainRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    BlockchainRecord.serializer,
    BlockchainRecord(
      (b) => b
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
