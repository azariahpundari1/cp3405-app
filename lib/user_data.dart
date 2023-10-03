class User {
  String name;
  String email;
  String inviteCode;
  String password;
  double points;

  User({
    required this.name,
    required this.email,
    required this.inviteCode,
    required this.password,
    required this.points,
  });
}

List<User> registeredUsers = [
  User(name: 'Daniel', email: 'student', inviteCode: '0', password: 'admin', points: 100),
  User(name: 'Bob', email: 'teacher', inviteCode: '1', password: 'admin', points: 0)
];
