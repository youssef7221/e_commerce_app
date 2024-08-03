import 'package:equatable/equatable.dart';

import 'UserEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2OGVmZGY4ZWQwZGMwMDE2Yzk4Yjk1YSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzIxNTk1NTE3LCJleHAiOjE3MjkzNzE1MTd9.Izp9cmDhbYraY3KyCHQwhHMOA5a2jUYaSYGDJZ8NwuM"

class UserEntity extends Equatable{
  UserEntity({
      this.user,
      this.token,
  this.message});
  UserDE? user;
  String? token;

  String?message;

  @override
  // TODO: implement props
  List<Object?> get props => [user , token];


}
class UserDE extends Equatable{
  UserDE({
      this.name, 
      this.email, 
      this.role,});

  String? name;
  String? email;
  String? role;

  @override
  // TODO: implement props
  List<Object?> get props => [name , email];


}