// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fresherques_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FresherquesRecord> _$fresherquesRecordSerializer =
    new _$FresherquesRecordSerializer();

class _$FresherquesRecordSerializer
    implements StructuredSerializer<FresherquesRecord> {
  @override
  final Iterable<Type> types = const [FresherquesRecord, _$FresherquesRecord];
  @override
  final String wireName = 'FresherquesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FresherquesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.answer;
    if (value != null) {
      result
        ..add('answer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  FresherquesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FresherquesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'answer':
          result.answer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$FresherquesRecord extends FresherquesRecord {
  @override
  final String? title;
  @override
  final String? answer;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FresherquesRecord(
          [void Function(FresherquesRecordBuilder)? updates]) =>
      (new FresherquesRecordBuilder()..update(updates))._build();

  _$FresherquesRecord._({this.title, this.answer, this.ffRef}) : super._();

  @override
  FresherquesRecord rebuild(void Function(FresherquesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FresherquesRecordBuilder toBuilder() =>
      new FresherquesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FresherquesRecord &&
        title == other.title &&
        answer == other.answer &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, title.hashCode), answer.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FresherquesRecord')
          ..add('title', title)
          ..add('answer', answer)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FresherquesRecordBuilder
    implements Builder<FresherquesRecord, FresherquesRecordBuilder> {
  _$FresherquesRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _answer;
  String? get answer => _$this._answer;
  set answer(String? answer) => _$this._answer = answer;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FresherquesRecordBuilder() {
    FresherquesRecord._initializeBuilder(this);
  }

  FresherquesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _answer = $v.answer;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FresherquesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FresherquesRecord;
  }

  @override
  void update(void Function(FresherquesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FresherquesRecord build() => _build();

  _$FresherquesRecord _build() {
    final _$result = _$v ??
        new _$FresherquesRecord._(title: title, answer: answer, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
