class AuthData {
  AuthData({
    required this.userData,
    required this.profiles,
  });

  final UserData userData;
  final UserProfiles profiles;

  factory AuthData.fromMap(Map<String, dynamic> json) => AuthData(
        userData: UserData.fromMap(json["user"]),
        profiles: UserProfiles.fromMap(json["profiles"]),
      );

  Map<String, dynamic> toMap() => {
        "user": userData.toMap(),
        "profiles": profiles.toMap(),
      };
}

class UserProfiles {
  UserProfiles({
    required this.player,
  });

  final UserProfile player;

  factory UserProfiles.fromMap(Map<String, dynamic> json) => UserProfiles(
        player: UserProfile.fromMap(json["PLAYER"]),
      );

  Map<String, dynamic> toMap() => {
        "PLAYER": player.toMap(),
      };
}

class UserProfile {
  UserProfile({
    required this.profileName,
    required this.userData,
    required this.created,
    required this.modified,
    required this.isSuspended,
  });

  final String profileName;
  final UserData userData;
  final DateTime created;
  final DateTime modified;
  final bool isSuspended;

  factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
        profileName: json["profile_name"] ?? '',
        userData: UserData.fromMap(json["user_profile"]),
        created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),
        isSuspended: json["is_suspended"],
      );

  Map<String, dynamic> toMap() => {
        "profile_name": profileName,
        "user_profile": userData.toMap(),
        "created": created.toIso8601String(),
        "modified": modified.toIso8601String(),
        "is_suspended": isSuspended,
      };
}

class UserData {
  UserData({
    required this.userId,
    required this.email,
    required this.phone,
    required this.isActive,
  });

  final String userId;
  final String email;
  final dynamic phone;
  final bool isActive;

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        userId: json["user_id"],
        email: json["email"],
        phone: json["phone"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "email": email,
        "phone": phone,
        "is_active": isActive,
      };
}
