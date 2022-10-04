// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'angularques_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AngularquesRecord> _$angularquesRecordSerializer =
    new _$AngularquesRecordSerializer();

class _$AngularquesRecordSerializer
    implements StructuredSerializer<AngularquesRecord> {
  @override
  final Iterable<Type> types = const [AngularquesRecord, _$AngularquesRecord];
  @override
  final String wireName = 'AngularquesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AngularquesRecord object,
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
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  AngularquesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AngularquesRecordBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$AngularquesRecord extends AngularquesRecord {
  @override
  final String? title;
  @override
  final String? answer;
  @override
  final int? id;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AngularquesRecord(
          [void Function(AngularquesRecordBuilder)? updates]) =>
      (new AngularquesRecordBuilder()..update(updates))._build();

  _$AngularquesRecord._({this.title, this.answer, this.id, this.ffRef})
      : super._();

  @override
  AngularquesRecord rebuild(void Function(AngularquesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AngularquesRecordBuilder toBuilder() =>
      new AngularquesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AngularquesRecord &&
        title == other.title &&
        answer == other.answer &&
        id == other.id &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), answer.hashCode), id.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AngularquesRecord')
          ..add('title', title)
          ..add('answer', answer)
          ..add('id', id)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AngularquesRecordBuilder
    implements Builder<AngularquesRecord, AngularquesRecordBuilder> {
  _$AngularquesRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _answer;
  String? get answer => _$this._answer;
  set answer(String? answer) => _$this._answer = answer;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AngularquesRecordBuilder() {
    AngularquesRecord._initializeBuilder(this);
  }

  AngularquesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _answer = $v.answer;
      _id = $v.id;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AngularquesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AngularquesRecord;
  }

  @override
  void update(void Function(AngularquesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AngularquesRecord build() => _build();

  _$AngularquesRecord _build() {
    final _$result = _$v ??
        new _$AngularquesRecord._(
            title: title, answer: answer, id: id, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
