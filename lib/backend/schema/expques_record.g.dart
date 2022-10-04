// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expques_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExpquesRecord> _$expquesRecordSerializer =
    new _$ExpquesRecordSerializer();

class _$ExpquesRecordSerializer implements StructuredSerializer<ExpquesRecord> {
  @override
  final Iterable<Type> types = const [ExpquesRecord, _$ExpquesRecord];
  @override
  final String wireName = 'ExpquesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ExpquesRecord object,
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
  ExpquesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExpquesRecordBuilder();

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

class _$ExpquesRecord extends ExpquesRecord {
  @override
  final String? title;
  @override
  final String? answer;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ExpquesRecord([void Function(ExpquesRecordBuilder)? updates]) =>
      (new ExpquesRecordBuilder()..update(updates))._build();

  _$ExpquesRecord._({this.title, this.answer, this.ffRef}) : super._();

  @override
  ExpquesRecord rebuild(void Function(ExpquesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExpquesRecordBuilder toBuilder() => new ExpquesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExpquesRecord &&
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
    return (newBuiltValueToStringHelper(r'ExpquesRecord')
          ..add('title', title)
          ..add('answer', answer)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ExpquesRecordBuilder
    implements Builder<ExpquesRecord, ExpquesRecordBuilder> {
  _$ExpquesRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _answer;
  String? get answer => _$this._answer;
  set answer(String? answer) => _$this._answer = answer;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ExpquesRecordBuilder() {
    ExpquesRecord._initializeBuilder(this);
  }

  ExpquesRecordBuilder get _$this {
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
  void replace(ExpquesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExpquesRecord;
  }

  @override
  void update(void Function(ExpquesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExpquesRecord build() => _build();

  _$ExpquesRecord _build() {
    final _$result = _$v ??
        new _$ExpquesRecord._(title: title, answer: answer, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
