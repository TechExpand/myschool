class Profile {
  int id;
  String username;
  String email;

  Profile(
      {this.id,
        this.username,
        this.email,
       });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return  Profile(
        id: json['id'],
        username: json['username'],
        email: json['email'],
       );
  }
}
