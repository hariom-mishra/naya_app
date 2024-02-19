import 'dart:convert';

class UserModel {
  final String id;
  final String email;
  final String number;
  final String password;
  final String token;
  UserModel({
    required this.id,
    required this.email,
    required this.number,
    required this.password,
    required this.token,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? number,
    String? password,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      number: number ?? this.number,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'number': number,
      'password': password,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      number: map['number'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, number: $number, password: $password, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.id == id &&
      other.email == email &&
      other.number == number &&
      other.password == password &&
      other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      email.hashCode ^
      number.hashCode ^
      password.hashCode ^
      token.hashCode;
  }
}
