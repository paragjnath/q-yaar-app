class AuthData {
  AuthData({
    required this.userData,
    required this.profiles,
  });

  final UserData? userData;
  final UserProfiles? profiles;

  factory AuthData.fromMap(Map<String, dynamic> json) => AuthData(
        userData: json["user"] != null ? UserData.fromMap(json["user"]) : null,
        profiles: json["profiles"] != null
            ? UserProfiles.fromMap(json["profiles"])
            : null,
      );

  Map<String, dynamic> toMap() => {
        "user": userData?.toMap(),
        "profiles": profiles?.toMap(),
      };
}

class UserProfiles {
  UserProfiles({
    required this.player,
  });

  final UserProfile? player;

  factory UserProfiles.fromMap(Map<String, dynamic> json) => UserProfiles(
        player:
            json["PLAYER"] != null ? UserProfile.fromMap(json["PLAYER"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "PLAYER": player?.toMap(),
      };
}

class UserProfile {
  UserProfile({
    required this.profileData,
    required this.accessToken,
    required this.refreshToken,
  });

  final ProfileData? profileData;
  final String accessToken;
  final String refreshToken;

  factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
        profileData:
            json['data'] != null ? ProfileData.fromMap(json["data"]) : null,
        accessToken: json["access_token"] ?? '',
        refreshToken: json["refresh_token"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "data": profileData?.toMap(),
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}

class ProfileData {
  ProfileData({
    required this.profileName,
    required this.userData,
    required this.created,
    required this.modified,
    required this.isSuspended,
  });

  final String profileName;
  final UserData? userData;
  final DateTime? created;
  final DateTime? modified;
  final bool isSuspended;

  factory ProfileData.fromMap(Map<String, dynamic> json) => ProfileData(
        profileName: json["profile_name"] ?? '',
        userData: json["user_profile"] != null
            ? UserData.fromMap(json["user_profile"])
            : null,
        created: DateTime.tryParse(json["created"]),
        modified: DateTime.tryParse(json["modified"]),
        isSuspended: json["is_suspended"] ?? false,
      );

  Map<String, dynamic> toMap() => {
        "profile_name": profileName,
        "user_profile": userData?.toMap(),
        "created": created?.toIso8601String(),
        "modified": modified?.toIso8601String(),
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
  final String phone;
  final bool isActive;

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        userId: json["user_id"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        isActive: json["is_active"] ?? true,
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "email": email,
        "phone": phone,
        "is_active": isActive,
      };
}
