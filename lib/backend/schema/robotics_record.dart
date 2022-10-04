import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'robotics_record.g.dart';

abstract class RoboticsRecord
    implements Built<RoboticsRecord, RoboticsRecordBuilder> {
  static Serializer<RoboticsRecord> get serializer =>
      _$roboticsRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RoboticsRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('robotics');

  static Stream<RoboticsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RoboticsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RoboticsRecord._();
  factory RoboticsRecord([void Function(RoboticsRecordBuilder) updates]) =
      _$RoboticsRecord;

  static RoboticsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRoboticsRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    RoboticsRecord.serializer,
    RoboticsRecord(
      (r) => r
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
