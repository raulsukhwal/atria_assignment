import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../global_widgets/global-widget.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -11,
            left: -796,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.27,
                  child: Image.asset(
                    'assets/login_mobile_bg.png',
                    width: 1591,
                    height: 775,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 1591,
                        height: 775,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.grey.shade200,
                              Colors.grey.shade300,
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: 1591,
                  height: 775,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9E9E9).withOpacity(0.73),
                    backgroundBlendMode: BlendMode.overlay,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 775 - 11,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(color: const Color(0xFFE9E9E9).withOpacity(0.27)),
          ),
          Positioned(
            top: 40 + MediaQuery.of(context).padding.top,
            left: 140,
            child: const GlobalLogo(size: 114, isCircular: true),
          ),
          // Content
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
                  ),
                  child: Column(
                    children: [
                      // Space for logo
                      const SizedBox(height: 114 + 40),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 24,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Welcome Text using GlobalText
                              const GlobalText(
                                'Welcome to Atria\nHelping you power up\nevery site survey',
                                s: 24,
                                w: FontWeight.w800,
                                c: Color(0xFF1A1A1A),
                              ),
                              const SizedBox(height: 16),
                              const GlobalText(
                                'Log in to begin your next solar visit',
                                s: 14,
                                w: FontWeight.w500,
                                c: Color(0xFF888888),
                              ),
                              const SizedBox(height: 32),
                              // Phone Input using GlobalPhoneInput
                              GlobalTextField(
                                controller: _phoneController,
                                label: "Enter Phone Number",
                                hintText: "8209556233",
                              ),
                              const SizedBox(height: 32),
                              // Login Button using GlobalButton
                              GlobalButton(
                                text: 'Login',
                                onPressed: () {},

                                ///HERE LOGIN FUNCTION
                                height: 48,
                              ),
                              const SizedBox(height: 32),
                              // Sign Up Link
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle sign up
                                  },
                                  child: RichText(
                                    text: const TextSpan(
                                      text: "Don't have an account? ",
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Mulish',
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Sign up',
                                          style: TextStyle(
                                            color: Color(0xFF2196F3),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.underline,
                                            fontFamily: 'Mulish',
                                          ),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
