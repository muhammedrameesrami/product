import 'package:flutter/material.dart';
import 'package:product/modules/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';
import '../../util_constant/image_constants.dart';
import '../../util_constant/size_config.dart';
import '../../util_constant/color_constants.dart';
import '../../modules/auth/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'johndoe@Gmail.Com');
  final _passwordController = TextEditingController(text: '12345678');
  bool _isPasswordVisible = false;

  // Email Regex Validation
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // Basic email regex pattern
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<UserProvider>(context, listen: false);

      final result = await authProvider.login(
        _emailController.text,
        _passwordController.text,
      );

      if (mounted) {
        if (result['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Successful')),
          );
          // Navigation is handled by AuthWrapper in main.dart
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result['message'] ?? 'Login failed')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch isLoading from provider
    final isLoading = context.watch<UserProvider>().isLoading;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: h * 0.4,
                  child: Image.asset(
                    ImageConstants.loginBg,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + h * 0.02,
                  right: w * 0.03,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.01),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Skip',
                          style: TextStyle(
                            color: ColorConstants.white,
                            fontWeight: FontWeight.bold,
                            fontSize: w * 0.035,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.arrow_forward_ios,
                            size: w * 0.03, color: ColorConstants.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Login Form Section
            Padding(
              padding: EdgeInsets.all(w * 0.06),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: w * 0.07,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.textPrimary,
                      ),
                    ),
                    SizedBox(height: h * 0.03),

                    // Email Field
                    Text('Email Address',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: w * 0.04)),
                    SizedBox(height: h * 0.01),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.02),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: ColorConstants.inputFillColor,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                    ),
                    SizedBox(height: h * 0.02),

                    // Password Field
                    Text('Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: w * 0.04)),
                    SizedBox(height: h * 0.01),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w * 0.02),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: ColorConstants.inputFillColor,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: ColorConstants.textSecondary,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: _validatePassword,
                    ),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              color: ColorConstants.textSecondary,
                              decoration: TextDecoration.underline,
                              fontSize: w * 0.035),
                        ),
                      ),
                    ),

                    SizedBox(height: h * 0.03),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: h * 0.06,
                      child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));},
                        // onPressed: isLoading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ColorConstants.buttonColor, // Brownish color
                          foregroundColor: ColorConstants.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(w * 0.02),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: ColorConstants.white)
                            : Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: w * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: h * 0.02),

                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't Have an account?",
                            style: TextStyle(fontSize: w * 0.035)),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.textPrimary,
                                decoration: TextDecoration.underline,
                                fontSize: w * 0.035),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
