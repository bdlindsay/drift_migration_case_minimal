import 'package:drift/drift.dart';
import 'package:drift_migration_case_minimal/database_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [MyTable])
class MyDatabase extends _$MyDatabase {
  MyDatabase(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(onUpgrade: (m, from, to) async {
        print('migrating from $from to $to');
        if (from < 2) {
          // removes the "notes" column _and_ add addedRealColumn
          await m.alterTable(TableMigration(myTable));
        }
        print('finished');
      });
}
