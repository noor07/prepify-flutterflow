import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'discord_record.g.dart';

abstract class DiscordRecord
    implements Built<DiscordRecord, DiscordRecordBuilder> {
  static Serializer<DiscordRecord> get serializer => _$discordRecordSerializer;

  int? get id;

  String? get title;

  String? get answer;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DiscordRecordBuilder builder) => builder
    ..id = 0
    ..title = ''
    ..answer = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('discord');

  static Stream<DiscordRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DiscordRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DiscordRecord._();
  factory DiscordRecord([void Function(DiscordRecordBuilder) updates]) =
      _$DiscordRecord;

  static DiscordRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDiscordRecordData({
  int? id,
  String? title,
  String? answer,
}) {
  final firestoreData = serializers.toFirestore(
    DiscordRecord.serializer,
    DiscordRecord(
      (d) => d
        ..id = id
        ..title = title
        ..answer = answer,
    ),
  );

  return firestoreData;
}
