class OtpSuccessResponse {
  final bool success;
  final String token;
  final String fairbasetoken;
  final UserData userData;
  final String message;

  OtpSuccessResponse({
    required this.success,
    required this.token,
    required this.fairbasetoken,
    required this.userData,
    required this.message,
  });

  factory OtpSuccessResponse.fromJson(Map<String, dynamic> json) {
    return OtpSuccessResponse(
      success: json['success'] ?? false,
      token: json['data']['token'] ?? '',
      fairbasetoken: json['data']['fairbasetoken'] ?? '',
      userData: UserData.fromJson(json['data']['user_data']),
      message: json['message'] ?? '',
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String mobile;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Role> roles;

  UserData({
    required this.id,
    required this.name,
    required this.mobile,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      mobile: json['mobile'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      roles: (json['roles'] as List)
          .map((roleJson) => Role.fromJson(roleJson))
          .toList(),
    );
  }
}

class Role {
  final int roleId;
  final String roleName;

  Role({
    required this.roleId,
    required this.roleName,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      roleId: json['role_id'] ?? 0,
      roleName: json['role_name'] ?? '',
    );
  }
}
