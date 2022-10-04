import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'dropbox_record.g.dart';

abstract class DropboxRecord
    implements Built<DropboxRecord, DropboxRecordBuilder> {
  static Serializer<DropboxRecord> get serializer => _$dropboxRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DropboxRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dropbox');

  static Stream<DropboxRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DropboxRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DropboxRecord._();
  factory DropboxRecord([void Function(DropboxRecordBuilder) updates]) =
      _$DropboxRecord;

  static DropboxRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDropboxRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    DropboxRecord.serializer,
    DropboxRecord(
      (d) => d
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
