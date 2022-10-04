import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'swift_record.g.dart';

abstract class SwiftRecord implements Built<SwiftRecord, SwiftRecordBuilder> {
  static Serializer<SwiftRecord> get serializer => _$swiftRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SwiftRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('swift');

  static Stream<SwiftRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SwiftRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SwiftRecord._();
  factory SwiftRecord([void Function(SwiftRecordBuilder) updates]) =
      _$SwiftRecord;

  static SwiftRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSwiftRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    SwiftRecord.serializer,
    SwiftRecord(
      (s) => s
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
