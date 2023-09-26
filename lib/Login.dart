import 'package:flutter/material.dart';
import 'package:flutter_school_app/NavViewPage.dart';
import 'package:flutter_school_app/Student/NavViewPageStudent.dart';
import 'package:flutter_school_app/register.dart';
import 'user_data.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers here to prevent null errors
    _emailController.text = ''; // Optionally clear the initial text
    _passwordController.text = ''; // Optionally clear the initial text
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20.0), // Add margin to separate logo from other content
            child: Image.asset(
              'assets/logo1.png', //image file
              width: 500, // Adjust the width of the logo
              height: 110, // Adjust the height of the logo
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0), // Add margin to separate logo from other content
            child: const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.black, // Text color
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black),
              borderRadius: BorderRadius.circular(10), // Add square border
            ),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'School Email',
                border: InputBorder.none, // Remove default border
                contentPadding: EdgeInsets.all(10.0), // Adjust padding
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(10) // Add square border
                ),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: InputBorder.none, // Remove default border
                contentPadding: EdgeInsets.all(10.0), // Adjust padding
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 1, 87, 155)),
            ),
            onPressed: () {
              // Get the entered username and password
              String email = _emailController.text;
              String password = _passwordController.text;

              // Print registered users in debug consol
              print('registeredUsers:');
              for (User user in registeredUsers) {
                print('name: ${user.name}, Email: ${user.email}, Password: ${user.password}');
              }
              // Check if the entered credentials match the master credentials
              bool isTeacher = false;
              bool isUserFound = false;
              for (User user in registeredUsers) {
                if (user.email == email && user.password == password) {
                  isUserFound = true;
                  if (user.inviteCode == '1') {
                    isTeacher = true;
                  }
                  break;
                }
              }
              if (isUserFound) {
                if (isTeacher) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavViewPage(),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavViewPageStudent(),
                    ),
                  );
                }
              } else {
                // Show an error message for incorrect credentials
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid username or password'),
                  ),
                );
              }
            },
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 16, color: Colors.white), // Adjust font size here
            ),
          ),
          const SizedBox(height: 10.0), // Add spacing between the Login and Register buttons
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 40, vertical: 10), // Adjust size here
              ),
              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 1, 87, 155)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => register(),
                ),
              );
            },
            child: const Text(
              'Register Account',
              style: TextStyle(fontSize: 16, color: Colors.white), // Adjust font size here
            ),
          ),
        ],
      ),
    );
  }
}
