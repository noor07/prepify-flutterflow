// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projectmanager_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProjectmanagerRecord> _$projectmanagerRecordSerializer =
    new _$ProjectmanagerRecordSerializer();

class _$ProjectmanagerRecordSerializer
    implements StructuredSerializer<ProjectmanagerRecord> {
  @override
  final Iterable<Type> types = const [
    ProjectmanagerRecord,
    _$ProjectmanagerRecord
  ];
  @override
  final String wireName = 'ProjectmanagerRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ProjectmanagerRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
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
  ProjectmanagerRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProjectmanagerRecordBuilder();

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

class _$ProjectmanagerRecord extends ProjectmanagerRecord {
  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? answer;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProjectmanagerRecord(
          [void Function(ProjectmanagerRecordBuilder)? updates]) =>
      (new ProjectmanagerRecordBuilder()..update(updates))._build();

  _$ProjectmanagerRecord._({this.id, this.title, this.answer, this.ffRef})
      : super._();

  @override
  ProjectmanagerRecord rebuild(
          void Function(ProjectmanagerRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectmanagerRecordBuilder toBuilder() =>
      new ProjectmanagerRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProjectmanagerRecord &&
        id == other.id &&
        title == other.title &&
        answer == other.answer &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), title.hashCode), answer.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProjectmanagerRecord')
          ..add('id', id)
          ..add('title', title)
          ..add('answer', answer)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProjectmanagerRecordBuilder
    implements Builder<ProjectmanagerRecord, ProjectmanagerRecordBuilder> {
  _$ProjectmanagerRecord? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _answer;
  String? get answer => _$this._answer;
  set answer(String? answer) => _$this._answer = answer;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProjectmanagerRecordBuilder() {
    ProjectmanagerRecord._initializeBuilder(this);
  }

  ProjectmanagerRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _answer = $v.answer;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProjectmanagerRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProjectmanagerRecord;
  }

  @override
  void update(void Function(ProjectmanagerRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProjectmanagerRecord build() => _build();

  _$ProjectmanagerRecord _build() {
    final _$result = _$v ??
        new _$ProjectmanagerRecord._(
            id: id, title: title, answer: answer, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas