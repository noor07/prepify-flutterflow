import 'package:built_value/standard_json_plugin.dart';

import 'fresherques_record.dart';
import 'expques_record.dart';
import 'angularques_record.dart';
import 'androidques_record.dart';
import 'bootstarpques_record.dart';
import 'cques_record.dart';
import 'cssques_record.dart';
import 'chashques_record.dart';
import 'dart_record.dart';
import 'django_record.dart';
import 'net_record.dart';
import 'flutter_record.dart';
import 'go_record.dart';
import 'html_record.dart';
import 'java_record.dart';
import 'jquery_record.dart';
import 'kotlin_record.dart';
import 'nodejs_record.dart';
import 'perl_record.dart';
import 'php_record.dart';
import 'python_record.dart';
import 'react_record.dart';
import 'swift_record.dart';
import 'typescript_record.dart';
import 'vue_record.dart';
import 'aerospace_record.dart';
import 'chemical_record.dart';
import 'civil_record.dart';
import 'computerscience_record.dart';
import 'electrical_record.dart';
import 'mechanical_record.dart';
import 'robotics_record.dart';
import 'finance_record.dart';
import 'hr_record.dart';
import 'marketing_record.dart';
import 'operations_record.dart';
import 'sales_record.dart';
import 'accenture_record.dart';
import 'airbnb_record.dart';
import 'airtel_record.dart';
import 'amd_record.dart';
import 'apple_record.dart';
import 'amazon_record.dart';
import 'cognizant_record.dart';
import 'discord_record.dart';
import 'dropbox_record.dart';
import 'facebook_record.dart';
import 'aftereffects_record.dart';
import 'aws_record.dart';
import 'android_studio_record.dart';
import 'behance_record.dart';
import 'blender_record.dart';
import 'canva_record.dart';
import 'chrome_record.dart';
import 'user_record.dart';
import 'figma_record.dart';
import 'firebase_record.dart';
import 'git_record.dart';
import 'gcp_record.dart';
import 'illustrator_record.dart';
import 'linux_record.dart';
import 'matlab_record.dart';
import 'maya_record.dart';
import 'sql_record.dart';
import 'photoshop_record.dart';
import 'premiere_record.dart';
import 'saleforce_record.dart';
import 'selenium_record.dart';
import 'tensorflow_record.dart';
import 'unity3d_record.dart';
import 'unreal_record.dart';
import 'adobexd_record.dart';
import 'javascript_record.dart';
import 'accountant_record.dart';
import 'bigdata_record.dart';
import 'blockchain_record.dart';
import 'ai_record.dart';
import 'budget_record.dart';
import 'cloudarchitect_record.dart';
import 'datascientist_record.dart';
import 'dataanalyst_record.dart';
import 'databasemanager_record.dart';
import 'devops_record.dart';
import 'financialanalyst_record.dart';
import 'fullstackdev_record.dart';
import 'hrmanager_record.dart';
import 'systemsecurity_record.dart';
import 'iot_record.dart';
import 'itmanager_record.dart';
import 'marketingmanager_record.dart';
import 'researchanalyst_record.dart';
import 'productmanager_record.dart';
import 'projectmanager_record.dart';
import 'salesmanager_record.dart';
import 'softwarearchitect_record.dart';
import 'softwaredevelopementengineer_record.dart';
import 'softwaredevelopementmanager_record.dart';

import 'index.dart';

export 'index.dart';

part 'serializers.g.dart';

const kDocumentReferenceField = 'Document__Reference__Field';

@SerializersFor(const [
  FresherquesRecord,
  ExpquesRecord,
  AngularquesRecord,
  AndroidquesRecord,
  BootstarpquesRecord,
  CquesRecord,
  CssquesRecord,
  ChashquesRecord,
  DartRecord,
  DjangoRecord,
  NetRecord,
  FlutterRecord,
  GoRecord,
  HtmlRecord,
  JavaRecord,
  JqueryRecord,
  KotlinRecord,
  NodejsRecord,
  PerlRecord,
  PhpRecord,
  PythonRecord,
  ReactRecord,
  SwiftRecord,
  TypescriptRecord,
  VueRecord,
  AerospaceRecord,
  ChemicalRecord,
  CivilRecord,
  ComputerscienceRecord,
  ElectricalRecord,
  MechanicalRecord,
  RoboticsRecord,
  FinanceRecord,
  HrRecord,
  MarketingRecord,
  OperationsRecord,
  SalesRecord,
  AccentureRecord,
  AirbnbRecord,
  AirtelRecord,
  AmdRecord,
  AppleRecord,
  AmazonRecord,
  CognizantRecord,
  DiscordRecord,
  DropboxRecord,
  FacebookRecord,
  AftereffectsRecord,
  AwsRecord,
  AndroidStudioRecord,
  BehanceRecord,
  BlenderRecord,
  CanvaRecord,
  ChromeRecord,
  UserRecord,
  FigmaRecord,
  FirebaseRecord,
  GitRecord,
  GcpRecord,
  IllustratorRecord,
  LinuxRecord,
  MatlabRecord,
  MayaRecord,
  SqlRecord,
  PhotoshopRecord,
  PremiereRecord,
  SaleforceRecord,
  SeleniumRecord,
  TensorflowRecord,
  Unity3dRecord,
  UnrealRecord,
  AdobexdRecord,
  JavascriptRecord,
  AccountantRecord,
  BigdataRecord,
  BlockchainRecord,
  AiRecord,
  BudgetRecord,
  CloudarchitectRecord,
  DatascientistRecord,
  DataanalystRecord,
  DatabasemanagerRecord,
  DevopsRecord,
  FinancialanalystRecord,
  FullstackdevRecord,
  HrmanagerRecord,
  SystemsecurityRecord,
  IotRecord,
  ItmanagerRecord,
  MarketingmanagerRecord,
  ResearchanalystRecord,
  ProductmanagerRecord,
  ProjectmanagerRecord,
  SalesmanagerRecord,
  SoftwarearchitectRecord,
  SoftwaredevelopementengineerRecord,
  SoftwaredevelopementmanagerRecord,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(DocumentReferenceSerializer())
      ..add(DateTimeSerializer())
      ..add(LatLngSerializer())
      ..add(FirestoreUtilDataSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();

extension SerializerExtensions on Serializers {
  Map<String, dynamic> toFirestore<T>(Serializer<T> serializer, T object) =>
      mapToFirestore(serializeWith(serializer, object) as Map<String, dynamic>);
}

class DocumentReferenceSerializer
    implements PrimitiveSerializer<DocumentReference> {
  final bool structured = false;
  @override
  final Iterable<Type> types = new BuiltList<Type>([DocumentReference]);
  @override
  final String wireName = 'DocumentReference';

  @override
  Object serialize(Serializers serializers, DocumentReference reference,
      {FullType specifiedType: FullType.unspecified}) {
    return reference;
  }

  @override
  DocumentReference deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      serialized as DocumentReference;
}

class DateTimeSerializer implements PrimitiveSerializer<DateTime> {
  @override
  final Iterable<Type> types = new BuiltList<Type>([DateTime]);
  @override
  final String wireName = 'DateTime';

  @override
  Object serialize(Serializers serializers, DateTime dateTime,
      {FullType specifiedType: FullType.unspecified}) {
    return dateTime;
  }

  @override
  DateTime deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      serialized as DateTime;
}

class LatLngSerializer implements PrimitiveSerializer<LatLng> {
  final bool structured = false;
  @override
  final Iterable<Type> types = new BuiltList<Type>([LatLng]);
  @override
  final String wireName = 'LatLng';

  @override
  Object serialize(Serializers serializers, LatLng location,
      {FullType specifiedType: FullType.unspecified}) {
    return location;
  }

  @override
  LatLng deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      serialized as LatLng;
}

class FirestoreUtilData {
  const FirestoreUtilData({
    this.fieldValues = const {},
    this.clearUnsetFields = true,
    this.create = false,
    this.delete = false,
  });
  final Map<String, dynamic> fieldValues;
  final bool clearUnsetFields;
  final bool create;
  final bool delete;
  static String get name => 'firestoreUtilData';
}

class FirestoreUtilDataSerializer
    implements PrimitiveSerializer<FirestoreUtilData> {
  final bool structured = false;
  @override
  final Iterable<Type> types = new BuiltList<Type>([FirestoreUtilData]);
  @override
  final String wireName = 'FirestoreUtilData';

  @override
  Object serialize(Serializers serializers, FirestoreUtilData firestoreUtilData,
      {FullType specifiedType: FullType.unspecified}) {
    return firestoreUtilData;
  }

  @override
  FirestoreUtilData deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      serialized as FirestoreUtilData;
}

Map<String, dynamic> serializedData(DocumentSnapshot doc) => {
      ...mapFromFirestore(doc.data() as Map<String, dynamic>),
      kDocumentReferenceField: doc.reference
    };

Map<String, dynamic> mapFromFirestore(Map<String, dynamic> data) =>
    mergeNestedFields(data)
        .where((k, _) => k != FirestoreUtilData.name)
        .map((key, value) {
      // Handle Timestamp
      if (value is Timestamp) {
        value = value.toDate();
      }
      // Handle list of Timestamp
      if (value is Iterable && value.isNotEmpty && value.first is Timestamp) {
        value = value.map((v) => (v as Timestamp).toDate()).toList();
      }
      // Handle GeoPoint
      if (value is GeoPoint) {
        value = value.toLatLng();
      }
      // Handle list of GeoPoint
      if (value is Iterable && value.isNotEmpty && value.first is GeoPoint) {
        value = value.map((v) => (v as GeoPoint).toLatLng()).toList();
      }
      // Handle nested data.
      if (value is Map) {
        value = mapFromFirestore(value as Map<String, dynamic>);
      }
      // Handle list of nested data.
      if (value is Iterable && value.isNotEmpty && value.first is Map) {
        value = value
            .map((v) => mapFromFirestore(v as Map<String, dynamic>))
            .toList();
      }
      return MapEntry(key, value);
    });

Map<String, dynamic> mapToFirestore(Map<String, dynamic> data) =>
    data.where((k, v) => k != FirestoreUtilData.name).map((key, value) {
      // Handle GeoPoint
      if (value is LatLng) {
        value = value.toGeoPoint();
      }
      // Handle list of GeoPoint
      if (value is Iterable && value.isNotEmpty && value.first is LatLng) {
        value = value.map((v) => (v as LatLng).toGeoPoint()).toList();
      }
      // Handle nested data.
      if (value is Map) {
        value = mapFromFirestore(value as Map<String, dynamic>);
      }
      // Handle list of nested data.
      if (value is Iterable && value.isNotEmpty && value.first is Map) {
        value = value
            .map((v) => mapFromFirestore(v as Map<String, dynamic>))
            .toList();
      }
      return MapEntry(key, value);
    });

extension GeoPointExtension on LatLng {
  GeoPoint toGeoPoint() => GeoPoint(latitude, longitude);
}

extension LatLngExtension on GeoPoint {
  LatLng toLatLng() => LatLng(latitude, longitude);
}

DocumentReference toRef(String ref) => FirebaseFirestore.instance.doc(ref);

T? safeGet<T>(T Function() func, [Function(dynamic)? reportError]) {
  try {
    return func();
  } catch (e) {
    reportError?.call(e);
  }
  return null;
}

Map<String, dynamic> mergeNestedFields(Map<String, dynamic> data) {
  final nestedData = data.where((k, _) => k.contains('.'));
  final fieldNames = nestedData.keys.map((k) => k.split('.').first).toSet();
  // Remove nested values (e.g. 'foo.bar') and merge them into a map.
  data.removeWhere((k, _) => k.contains('.'));
  fieldNames.forEach((name) {
    final mergedValues = mergeNestedFields(
      nestedData
          .where((k, _) => k.split('.').first == name)
          .map((k, v) => MapEntry(k.split('.').skip(1).join('.'), v)),
    );
    final existingValue = data[name];
    data[name] = {
      if (existingValue != null && existingValue is Map)
        ...existingValue as Map<String, dynamic>,
      ...mergedValues,
    };
  });
  // Merge any nested maps inside any of the fields as well.
  data.where((_, v) => v is Map).forEach((k, v) {
    data[k] = mergeNestedFields(v as Map<String, dynamic>);
  });

  return data;
}

extension _WhereMapExtension<K, V> on Map<K, V> {
  Map<K, V> where(bool Function(K, V) test) =>
      Map.fromEntries(entries.where((e) => test(e.key, e.value)));
}
