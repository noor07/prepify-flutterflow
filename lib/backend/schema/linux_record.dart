import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'linux_record.g.dart';

abstract class LinuxRecord implements Built<LinuxRecord, LinuxRecordBuilder> {
  static Serializer<LinuxRecord> get serializer => _$linuxRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LinuxRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('linux');

  static Stream<LinuxRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LinuxRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LinuxRecord._();
  factory LinuxRecord([void Function(LinuxRecordBuilder) updates]) =
      _$LinuxRecord;

  static LinuxRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLinuxRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    LinuxRecord.serializer,
    LinuxRecord(
      (l) => l
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
