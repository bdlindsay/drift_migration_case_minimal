import 'package:drift/drift.dart';

class MyTable extends Table {
  TextColumn get id => text()();
  RealColumn get addedRealColumn => real().nullable().withDefault(const Constant(null))();
}
