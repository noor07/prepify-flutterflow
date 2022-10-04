import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'unreal_record.g.dart';

abstract class UnrealRecord
    implements Built<UnrealRecord, UnrealRecordBuilder> {
  static Serializer<UnrealRecord> get serializer => _$unrealRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UnrealRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('unreal');

  static Stream<UnrealRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UnrealRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UnrealRecord._();
  factory UnrealRecord([void Function(UnrealRecordBuilder) updates]) =
      _$UnrealRecord;

  static UnrealRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUnrealRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    UnrealRecord.serializer,
    UnrealRecord(
      (u) => u
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
