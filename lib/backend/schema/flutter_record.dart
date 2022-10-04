import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'flutter_record.g.dart';

abstract class FlutterRecord
    implements Built<FlutterRecord, FlutterRecordBuilder> {
  static Serializer<FlutterRecord> get serializer => _$flutterRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FlutterRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('flutter');

  static Stream<FlutterRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FlutterRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FlutterRecord._();
  factory FlutterRecord([void Function(FlutterRecordBuilder) updates]) =
      _$FlutterRecord;

  static FlutterRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFlutterRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    FlutterRecord.serializer,
    FlutterRecord(
      (f) => f
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
