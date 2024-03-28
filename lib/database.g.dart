// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MyTableTable extends MyTable with TableInfo<$MyTableTable, MyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addedRealColumnMeta =
      const VerificationMeta('addedRealColumn');
  @override
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
  VerificationContext validateIntegrity(Insertable<MyTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('added_real_column')) {
      context.handle(
          _addedRealColumnMeta,
          addedRealColumn.isAcceptableOrUnknown(
              data['added_real_column']!, _addedRealColumnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      addedRealColumn: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}added_real_column']),
    );
  }

  @override
  $MyTableTable createAlias(String alias) {
    return $MyTableTable(attachedDatabase, alias);
  }
}

class MyTableData extends DataClass implements Insertable<MyTableData> {
  final String id;
  final double? addedRealColumn;
  const MyTableData({required this.id, this.addedRealColumn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || addedRealColumn != null) {
      map['added_real_column'] = Variable<double>(addedRealColumn);
    }
    return map;
  }

  MyTableCompanion toCompanion(bool nullToAbsent) {
    return MyTableCompanion(
      id: Value(id),
      addedRealColumn: addedRealColumn == null && nullToAbsent
          ? const Value.absent()
          : Value(addedRealColumn),
    );
  }

  factory MyTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyTableData(
      id: serializer.fromJson<String>(json['id']),
      addedRealColumn: serializer.fromJson<double?>(json['addedRealColumn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'addedRealColumn': serializer.toJson<double?>(addedRealColumn),
    };
  }

  MyTableData copyWith(
          {String? id,
          Value<double?> addedRealColumn = const Value.absent()}) =>
      MyTableData(
        id: id ?? this.id,
        addedRealColumn: addedRealColumn.present
            ? addedRealColumn.value
            : this.addedRealColumn,
      );
  @override
  String toString() {
    return (StringBuffer('MyTableData(')
          ..write('id: $id, ')
          ..write('addedRealColumn: $addedRealColumn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, addedRealColumn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyTableData &&
          other.id == this.id &&
          other.addedRealColumn == this.addedRealColumn);
}

class MyTableCompanion extends UpdateCompanion<MyTableData> {
  final Value<String> id;
  final Value<double?> addedRealColumn;
  final Value<int> rowid;
  const MyTableCompanion({
    this.id = const Value.absent(),
    this.addedRealColumn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MyTableCompanion.insert({
    required String id,
    this.addedRealColumn = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<MyTableData> custom({
    Expression<String>? id,
    Expression<double>? addedRealColumn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (addedRealColumn != null) 'added_real_column': addedRealColumn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MyTableCompanion copyWith(
      {Value<String>? id, Value<double?>? addedRealColumn, Value<int>? rowid}) {
    return MyTableCompanion(
      id: id ?? this.id,
      addedRealColumn: addedRealColumn ?? this.addedRealColumn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (addedRealColumn.present) {
      map['added_real_column'] = Variable<double>(addedRealColumn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyTableCompanion(')
          ..write('id: $id, ')
          ..write('addedRealColumn: $addedRealColumn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $MyTableTable myTable = $MyTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [myTable];
}
