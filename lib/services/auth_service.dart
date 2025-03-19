import 'dart:async';

class AuthService {
  Future<bool> registerUser(String firstName, String lastName, String email, String mobile) async {
    // Simulate API delay
    await Future.delayed(Duration(seconds: 2));

    // Empty response for now (later, replace this with real API calls)
    print("API Call: Registering user - $firstName $lastName, $email, $mobile");
    return true;
  }
}
