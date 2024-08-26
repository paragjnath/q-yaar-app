enum SharedPrefKeys {
  authData('auth_data');

  final String key;
  const SharedPrefKeys(this.key);

  @override
  String toString() => key;
}
