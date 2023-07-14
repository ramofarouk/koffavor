abstract class LocalStorage {
  Future<bool> addStringToList(String key, String value);

  Future<bool> clear();

  Future<bool> containsKey(String key);

  Future<bool> getBool(String key, [bool defaultValue = false]);

  Future<double?> getDouble(String key);

  Future<int?> getInt(String key);

  Future<String?> getString(String key);

  Future<List<String>?> getStringList(String key);

  Future<void> init();

  Future<bool> remove(String key);

  Future<bool> removeStringFromList(String key, String value);

  Future<bool> setBool(String key, bool value);

  Future<bool> setDouble(String key, double value);

  Future<bool> setInt(String key, int value);

  Future<bool> setString(String key, String value);

  Future<bool> setStringList(String key, List<String> value);
}

class LocalStorageException {
  final dynamic exception;

  final String? message;

  LocalStorageException(this.exception, [this.message]);

  factory LocalStorageException.unableToRead(
    dynamic exception, {
    required String key,
    required String type,
  }) =>
      LocalStorageException(
        exception,
        "Unable to read $type type with key $key from local storage.",
      );
}
