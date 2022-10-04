import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'javascript_record.g.dart';

abstract class JavascriptRecord
    implements Built<JavascriptRecord, JavascriptRecordBuilder> {
  static Serializer<JavascriptRecord> get serializer =>
      _$javascriptRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(JavascriptRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('javascript');

  static Stream<JavascriptRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JavascriptRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JavascriptRecord._();
  factory JavascriptRecord([void Function(JavascriptRecordBuilder) updates]) =
      _$JavascriptRecord;

  static JavascriptRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJavascriptRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    JavascriptRecord.serializer,
    JavascriptRecord(
      (j) => j
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
