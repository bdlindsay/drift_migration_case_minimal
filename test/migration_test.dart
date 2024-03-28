import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:drift_migration_case_minimal/database.dart';
import 'package:flutter_test/flutter_test.dart';

import 'generated/schema.dart';
import 'generated/schema_v1.dart' as v1;

void main() {
  late SchemaVerifier verifier;
  late MyDatabase database;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  tearDown(() {
    database.close();
  });

  test('can upgrade from v1 to v2', () async {
    final schema = await verifier.schemaAt(1);
    final v1Database = v1.DatabaseAtV1(schema.newConnection());
    await v1Database.close();

    database = MyDatabase(schema.newConnection());
    await verifier.migrateAndValidate(database, database.schemaVersion /*2*/);
  });

  test('can upgrade from v1 to v2 with inserted data', () async {
    try {
      final schema = await verifier.schemaAt(1);
      final v1Database = v1.DatabaseAtV1(schema.newConnection());
      await v1Database.close();

      await v1Database.customInsert("INSERT INTO my_table (id, notes) VALUES ('1', 'old notes')");

      database = MyDatabase(schema.newConnection());

      await verifier.migrateAndValidate(database, database.schemaVersion /*2*/);

      final rows = await database.customSelect('select * from my_table').get();
      print(rows.first.data); // {id: 1, added_real_column: added_real_column}

      final actual = await database.myTable.select().get();
      expect(actual, const [MyTableData(id: '1', addedRealColumn: null)]);
    } catch (error) {
      print(error);
      expect(error, null);
    }
  });
}
