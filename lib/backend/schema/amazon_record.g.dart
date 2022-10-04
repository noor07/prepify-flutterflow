// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amazon_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AmazonRecord> _$amazonRecordSerializer =
    new _$AmazonRecordSerializer();

class _$AmazonRecordSerializer implements StructuredSerializer<AmazonRecord> {
  @override
  final Iterable<Type> types = const [AmazonRecord, _$AmazonRecord];
  @override
  final String wireName = 'AmazonRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AmazonRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
  AmazonRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AmazonRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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

class _$AmazonRecord extends AmazonRecord {
  @override
  final int? id;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AmazonRecord([void Function(AmazonRecordBuilder)? updates]) =>
      (new AmazonRecordBuilder()..update(updates))._build();

  _$AmazonRecord._({this.id, this.ffRef}) : super._();

  @override
  AmazonRecord rebuild(void Function(AmazonRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AmazonRecordBuilder toBuilder() => new AmazonRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AmazonRecord && id == other.id && ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AmazonRecord')
          ..add('id', id)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AmazonRecordBuilder
    implements Builder<AmazonRecord, AmazonRecordBuilder> {
  _$AmazonRecord? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AmazonRecordBuilder() {
    AmazonRecord._initializeBuilder(this);
  }

  AmazonRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AmazonRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AmazonRecord;
  }

  @override
  void update(void Function(AmazonRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AmazonRecord build() => _build();

  _$AmazonRecord _build() {
    final _$result = _$v ?? new _$AmazonRecord._(id: id, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
