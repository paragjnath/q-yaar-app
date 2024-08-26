enum UserRoles {
  player,
  unknown;

  static UserRoles fromString(String value) {
    switch (value) {
      case 'PLAYER':
        return UserRoles.player;
      default:
        return UserRoles.unknown;
    }
  }

  @override
  String toString() {
    switch (this) {
      case UserRoles.player:
        return 'PLAYER';
      default:
        return 'UNKNOWN';
    }
  }
}
