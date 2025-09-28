
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AuthMode { login, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthMode _authMode = AuthMode.login;
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _termsAccepted = false;

  void _toggleAuthMode() {
    setState(() {
      _authMode = _authMode == AuthMode.login ? AuthMode.signup : AuthMode.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80),
                Text(
                  _authMode == AuthMode.login ? "Welcome Back" : "Create Account",
                  style: textTheme.displaySmall?.copyWith(fontFamily: 'Oswald'), // Using Oswald as placeholder
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Don't wait, just otlob",
                  style: textTheme.headlineSmall?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                if (_authMode == AuthMode.signup)
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Full Name", prefixIcon: Icon(Icons.person_outline)),
                    validator: (value) => value!.isEmpty ? "Please enter your name" : null,
                  ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Email Address", prefixIcon: Icon(Icons.email_outlined)),
                  keyboardType: TextInputType.emailAddress,
                   validator: (value) => (value!.isEmpty || !value.contains('@')) ? "Please enter a valid email" : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                   validator: (value) => (value!.isEmpty || value.length < 6) ? "Password must be at least 6 characters" : null,
                ),
                 if (_authMode == AuthMode.signup)
                  const SizedBox(height: 20),
                if (_authMode == AuthMode.signup)
                  TextFormField(
                    obscureText: true,
                     decoration: const InputDecoration(hintText: "Confirm Password", prefixIcon: Icon(Icons.lock_outline)),
                     validator: (value) => value!.isEmpty ? "Please confirm your password" : null,
                  ),
                if (_authMode == AuthMode.login)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                 if (_authMode == AuthMode.signup)
                  Row(
                    children: [
                      Checkbox(
                        value: _termsAccepted,
                        onChanged: (value) => setState(() => _termsAccepted = value!),
                      ),
                      Expanded(
                        child: Text("I agree to the Terms of Service and Privacy Policy", style: textTheme.bodySmall),
                      ),
                    ],
                  ),
                   const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                     if (_formKey.currentState!.validate()) {
                       context.go('/home');
                     }
                  },
                  child: Text(_authMode == AuthMode.login ? "Login" : "Sign Up"),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_authMode == AuthMode.login ? "Don't have an account?" : "Already have an account?"),
                    TextButton(
                      onPressed: _toggleAuthMode,
                      child: Text(_authMode == AuthMode.login ? "Sign Up" : "Login"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                 TextButton(
                      onPressed: () => context.go('/home'),
                      child: const Text("Skip for now"),
                    ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
