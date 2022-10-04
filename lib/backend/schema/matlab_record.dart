import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'matlab_record.g.dart';

abstract class MatlabRecord
    implements Built<MatlabRecord, MatlabRecordBuilder> {
  static Serializer<MatlabRecord> get serializer => _$matlabRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MatlabRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matlab');

  static Stream<MatlabRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MatlabRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MatlabRecord._();
  factory MatlabRecord([void Function(MatlabRecordBuilder) updates]) =
      _$MatlabRecord;

  static MatlabRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMatlabRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    MatlabRecord.serializer,
    MatlabRecord(
      (m) => m
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
