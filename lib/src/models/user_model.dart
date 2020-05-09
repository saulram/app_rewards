// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    UserClass user;

    User({
        this.user,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
    };
}

class UserClass {
    String id;
    String name;
    String surname;
    String email;
    String role;
    String profilePic;
    String password;
    int v;

    UserClass({
        this.id,
        this.name,
        this.surname,
        this.email,
        this.role,
        this.profilePic,
        this.password,
        this.v,
    });

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["_id"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        role: json["role"],
        profilePic: json["profile_pic"],
        password: json["password"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "surname": surname,
        "email": email,
        "role": role,
        "profile_pic": profilePic,
        "password": password,
        "__v": v,
    };
}
