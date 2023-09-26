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

List<User> registeredUsers = [User(name: 'Daniel', email: 'student', inviteCode: '0', password: 'admin'), User(name: 'Bob', email: 'teacher', inviteCode: '1', password: 'admin')];
