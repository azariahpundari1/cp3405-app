import 'package:flutter/material.dart';
import 'package:flutter_school_app/Login.dart';
import 'user_data.dart';

class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Back'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: RegistrationForm(),
      ),
    );
  }
}

void registerUser(String name, String email, String inviteCode, String password) {
  User newUser = User(
    name: name,
    email: email,
    inviteCode: inviteCode,
    password: password,
  );
  registeredUsers.add(newUser);
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _inviteCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20.0), // Add margin to separate logo from other content
          child: Image.asset(
            'assets/logo1.png',
            width: 500, // Adjust the width of the logo
            height: 110, // Adjust the height of the logo
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.0), // Add margin to separate logo from other content
          child: Text(
            'Register Account',
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
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: InputBorder.none, // Remove default border
              contentPadding: EdgeInsets.all(10.0), // Adjust padding
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.black),
            borderRadius: BorderRadius.circular(10), // Add square border
          ),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'School Email',
              border: InputBorder.none, // Remove default border
              contentPadding: EdgeInsets.all(10.0), // Adjust padding
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.black),
            borderRadius: BorderRadius.circular(10), // Add square border
          ),
          child: TextFormField(
            controller: _inviteCodeController,
            decoration: InputDecoration(
              labelText: 'School Invite Code',
              border: InputBorder.none, // Remove default border
              contentPadding: EdgeInsets.all(10.0), // Adjust padding
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.black),
            borderRadius: BorderRadius.circular(10), // Add square border
          ),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: InputBorder.none, // Remove default border
              contentPadding: EdgeInsets.all(10.0), // Adjust padding),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.black),
            borderRadius: BorderRadius.circular(10), // Add square border
          ),
          child: TextField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: InputBorder.none, // Remove default border
              contentPadding: EdgeInsets.all(10.0), // Adjust padding),
            ),
          ),
        ),
        SizedBox(height: 32.0),
        ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 75, vertical: 10),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 1, 87, 155)),
          ),
          onPressed: () {
            // Handle registration logic here
            String name = _nameController.text;
            String email = _emailController.text;
            String inviteCode = _inviteCodeController.text;
            String password = _passwordController.text;
            String confirmPassword = _confirmPasswordController.text;

            // Validate input and perform registration
            if (password == confirmPassword) {
              // Passwords match, proceed with registration
              registerUser(name, email, inviteCode, password);

              //clear form field
              _nameController.clear();
              _emailController.clear();
              _inviteCodeController.clear();
              _passwordController.clear();
              _confirmPasswordController.clear();

              //Show a success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Registration Complete'),
                ),
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            } else {
              // Passwords don't match, show an error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Passwords do not match.'),
                ),
              );
            }
          },
          child: Text(
            'Register', style: TextStyle(fontSize: 16, color: Colors.white), // Adjust font size here
          ),
        ),
      ],
    );
  }
}
