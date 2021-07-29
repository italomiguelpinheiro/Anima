class UserModel {

  String displayName;
  String email;
  String password;

  UserModel({
    required this.displayName,
    required this.email,
    required this.password,
  });

  UserModel.fromJson(Map<String, Object?> json)
      : this(
          displayName: json['displayName']! as String,
          email: json['email']! as String,
          password: json['password']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'displayName': this.displayName,
      'email': this.email,
      "password": this.password,
    };
  }
}

