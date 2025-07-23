import 'dart:ui';
import 'package:flutter/material.dart';
import '../../global_widgets/global-widget.dart';

class WebLoginScreen extends StatefulWidget {
  const WebLoginScreen({super.key});

  @override
  State<WebLoginScreen> createState() => _WebLoginScreenState();
}

class _WebLoginScreenState extends State<WebLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login_web_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Row(
              children: [
                // Left Panel - Feature Description
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 80,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: const Text(
                            'Powering Energy\nwith Smart\nManagement',
                            style: TextStyle(
                              fontSize: 57,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: 'Mulish',
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Center(
                          child: Text(
                            'Streamline your solar sales process with our\ncomprehensive platform. Track leads, manage\nprojects and close deals faster than ever',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFB0B0B0),
                              height: 1.6,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 48),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.11,
                            ),
                            GlobalFeatureTag(text: 'CRM'),
                            SizedBox(width: 20),
                            GlobalFeatureTag(text: 'Lead Management'),
                            SizedBox(width: 20),
                            GlobalFeatureTag(text: 'Project Tracking'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Right Panel - Login Form
                Expanded(
                  flex: 1,
                  child: Container(
                    color: const Color(0xFFF3F3F3),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 60,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const GlobalLogo(size: 90, isCircular: true),
                          const SizedBox(height: 40),
                          const Text(
                            'Welcome Back to AtriaForce',
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 48),
                          GlobalTextField(
                            controller: _emailController,
                            label: 'Email',
                            hintText: 'abc@gmail.com',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(
                                r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                              ).hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          GlobalTextField(
                            controller: _passwordController,
                            label: 'Password',
                            hintText: '•    •    •    •    •    •    ',
                            obscureText: _obscurePassword,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          GlobalButton(
                            text: 'Login',
                            onPressed: (){},/// HERE OUR LOGIN FUNCTIONALITY
                            isLoading: _isLoading,
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color(0xFFE31E24),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Need help? Contact us at ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF666666),
                                ),
                              ),
                              const SizedBox(height: 4),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'welcome@atriarenewable.com',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF2196F3),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF2196F3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
