import 'package:e_commerce/features/login_screen/domain/entities/UserEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2OGVmZGY4ZWQwZGMwMDE2Yzk4Yjk1YSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzIxNTk1NTE3LCJleHAiOjE3MjkzNzE1MTd9.Izp9cmDhbYraY3KyCHQwhHMOA5a2jUYaSYGDJZ8NwuM"

class UserModel extends UserEntity{
  UserModel({
      this.message, 
      super.user,
      super.token,});

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;

  @override
  List<Object?> get props => [super.props, message];
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti@gmail.com"
/// role : "user"

class User extends UserDE{
  User({
      super.name,
      super.email,
      super.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
  @override
  List<Object?> get props => [super.props, role];
}