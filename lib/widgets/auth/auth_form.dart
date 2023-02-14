import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, this.isLoading, {super.key});

  final bool isLoading;

  final void Function(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLoginMode = true;
  var _userEmail = '';
  var _userPassword = '';
  var _userName = '';

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();

    if (isValid != null && isValid) {
      _formKey.currentState?.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword,
        _userName,
        _isLoginMode,
        context,
      );

      // use these values to send our auth request ...
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: const ValueKey("email"),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return "Please enter a valid email address.";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email Address",
                    ),
                    onSaved: (value) {
                      if (value != null) {
                        _userEmail = value;
                      }
                    },
                  ),
                  if (!_isLoginMode)
                    TextFormField(
                      key: const ValueKey("username"),
                      validator: (value) {
                        if (value == null) {
                          return "Must enter some username";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: "Username"),
                      onSaved: (value) {
                        if (value != null) {
                          _userName = value;
                        }
                      },
                    ),
                  TextFormField(
                    key: const ValueKey("password"),
                    validator: (value) {
                      if (value == null || value.length < 7) {
                        return "Password must be at least 7 charachters long";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    onSaved: (value) {
                      if (value != null) {
                        _userPassword = value;
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  if (widget.isLoading) const CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      child: Text(_isLoginMode ? "Login" : "Signup"),
                      onPressed: () {
                        _trySubmit();
                      },
                    ),
                  if (!widget.isLoading)
                    TextButton(
                      child: Text(
                        _isLoginMode
                            ? "Create Account"
                            : "I Already Have an Account",
                      ),
                      onPressed: () {
                        setState(() {
                          _isLoginMode = !_isLoginMode;
                        });
                      },
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
