class User {
  String name;
  String email;
  String inviteCode;
  String password;

  User({
    required this.name,
    required this.email,
    required this.inviteCode,
    required this.password,
  });
}

List<User> registeredUsers = [User(name: 'Daniel', email: 'test@gmail.com', inviteCode: '42069', password: 'admin')];
