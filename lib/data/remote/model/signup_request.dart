import 'package:q_yaar/constants/user_roles.dart';

class SignupRequest {
  SignupRequest({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.role,
    required this.profileName,
  });

  final String email;
  final String password;
  final String confirmPassword;
  final UserRoles role;
  final String profileName;

  factory SignupRequest.fromMap(
    Map<String, dynamic> json,
  ) =>
      SignupRequest(
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        confirmPassword: json["confirm_password"] ?? "",
        role: UserRoles.fromString(json["role"] ?? ""),
        profileName: json["profile_name"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "role": role.toString(),
        "profile_name": profileName,
      };
}
