import 'dart:convert';

class UserModel {
  String name;
  String email;
  String password;
  String gender;
  String birth;
  String phone;
  UserModel({
    required this.name,
    required this.password,
    required this.birth,
    required this.email,
    required this.gender,
    required this.phone,
  });

  UserModel copyWith({
    String? name,
    String? password,
    String? birth,
    String? email,
    String? gender,
    String? phone,
  }) {
    return UserModel(
      name: name ?? this.name,
      password: password ?? this.password,
      birth: birth ?? this.birth,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      phone: gender ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': name});
    result.addAll({'password': password});
    result.addAll({'email': email});
    result.addAll({'gender': gender});
    result.addAll({'phone': phone});
    result.addAll({'birth': birth});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      password: map['password'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? '',
      phone: map['phone'] ?? '',
      birth: map['birth'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
