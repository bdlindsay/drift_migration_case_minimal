import 'package:drift/drift.dart';

class MyTable extends Table {
  TextColumn get id => text()();
  // removed column from version 1 to 2
  // TextColumn get notes => text()();
  RealColumn get addedRealColumn => real().nullable().withDefault(const Constant(null))();
}
