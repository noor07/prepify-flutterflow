import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'facebook_record.g.dart';

abstract class FacebookRecord
    implements Built<FacebookRecord, FacebookRecordBuilder> {
  static Serializer<FacebookRecord> get serializer =>
      _$facebookRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FacebookRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('facebook');

  static Stream<FacebookRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FacebookRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FacebookRecord._();
  factory FacebookRecord([void Function(FacebookRecordBuilder) updates]) =
      _$FacebookRecord;

  static FacebookRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFacebookRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    FacebookRecord.serializer,
    FacebookRecord(
      (f) => f
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
