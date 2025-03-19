import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '', lastName = '', email = '', mobile = '';
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "First Name"),
                validator: (value) => value!.isEmpty ? "Enter your first name" : null,
                onChanged: (value) => setState(() => firstName = value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Last Name"),
                validator: (value) => value!.isEmpty ? "Enter your last name" : null,
                onChanged: (value) => setState(() => lastName = value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => !value!.contains("@") ? "Enter a valid email" : null,
                onChanged: (value) => setState(() => email = value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Mobile Number"),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.length < 10 ? "Enter a valid mobile number" : null,
                onChanged: (value) => setState(() => mobile = value),
              ),
              SizedBox(height: 20),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => _isLoading = true);
                    bool success = await _authService.registerUser(firstName, lastName, email, mobile);
                    setState(() => _isLoading = false);

                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Registration Successful")),
                      );
                      Navigator.pop(context); // Go back to landing page
                    }
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
