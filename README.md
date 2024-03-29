# drift_migration_case_minimal
`dart run build_runner build --delete-conflicting-outputs`

`dart run drift_dev schema dump lib/database.dart test/drift_schemas`

`dart run drift_dev schema generate test/drift_schemas/ test/generated/`