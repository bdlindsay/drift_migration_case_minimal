// When Drift-generated classes call `toJson` or `fromJson` this code runs.
import 'package:drift/drift.dart';

class CustomSerializer extends ValueSerializer {
  const CustomSerializer();

  @override
  T fromJson<T>(dynamic json) {
    try {
      if (json == null) {
        return null as T;
      }

      final typeList = <T>[];

      if (typeList is List<double?> && json is int) {
        return json.toDouble() as T;
      }

      // blobs are encoded as a regular json array, so we manually convert that to
      // a Uint8List
      if (typeList is List<Uint8List?> && json is! Uint8List) {
        final asList = (json as List).cast<int>();
        return Uint8List.fromList(asList) as T;
      }

      if (typeList is List<List<String>?> && json is List<dynamic>) {
        final castList = json.cast<String>();
        return castList as T;
      }

      // Defer to default drift behavior
      return const ValueSerializer.defaults(serializeDateTimeValuesAsString: true).fromJson(json);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  dynamic toJson<T>(T value) {
    if (value is DateTime) {
      return value.toUtc().toIso8601String();
    }

    // Defer to default drift behavior
    return const ValueSerializer.defaults(serializeDateTimeValuesAsString: true).toJson<T>(value);
  }
}
