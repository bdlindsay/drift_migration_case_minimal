// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
//@dart=2.12
import 'package:drift/drift.dart';

class MyTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MyTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<double> addedRealColumn = GeneratedColumn<double>(
      'added_real_column', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(null));
  @override
  List<GeneratedColumn> get $columns => [id, addedRealColumn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_table';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  MyTable createAlias(String alias) {
    return MyTable(attachedDatabase, alias);
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final MyTable myTable = MyTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [myTable];
  @override
  int get schemaVersion => 2;
}
