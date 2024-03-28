import 'package:drift/drift.dart';
import 'package:drift_migration_case_minimal/database_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [MyTable])
class MyDatabase extends _$MyDatabase {
  MyDatabase(super.e);

  @override
  int get schemaVersion => 2;

  // Future<bool> _isColumnOnTable(String? table, String column) async {
  //   final tableRowsOfColumns = await customSelect('PRAGMA table_info($table)').get();

  //   final matches = tableRowsOfColumns
  //       .where(
  //         (element) => element.data['name'] == column,
  //       )
  //       .toList();

  //   return matches.isNotEmpty;
  // }

  @override
  MigrationStrategy get migration => MigrationStrategy(onUpgrade: (m, from, to) async {
        print('migrating from $from to $to');
        if (from < 2) {
          // expected to remove the "notes" column _and_ add addedRealColumn
          await m.alterTable(TableMigration(myTable));
        }
        print('finished');
      });
}
