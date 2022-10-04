import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'unity3d_record.g.dart';

abstract class Unity3dRecord
    implements Built<Unity3dRecord, Unity3dRecordBuilder> {
  static Serializer<Unity3dRecord> get serializer => _$unity3dRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(Unity3dRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('unity3d');

  static Stream<Unity3dRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Unity3dRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Unity3dRecord._();
  factory Unity3dRecord([void Function(Unity3dRecordBuilder) updates]) =
      _$Unity3dRecord;

  static Unity3dRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUnity3dRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    Unity3dRecord.serializer,
    Unity3dRecord(
      (u) => u
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
