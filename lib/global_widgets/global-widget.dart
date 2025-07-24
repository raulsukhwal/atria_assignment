import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const GlobalTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE31E24), width: 1.5),
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontFamily: 'Mulish',
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xFF999999),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              suffixIcon: suffixIcon,
              isDense: true,
            ),
            validator: validator,
          ),
        ),
        Positioned(
          left: 12,
          top: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            color: Colors.white,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF707070),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GlobalButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double height;

  const GlobalButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE31E24),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child:
            isLoading
                ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                : Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
      ),
    );
  }
}

class GlobalLogo extends StatelessWidget {
  final double size;
  final bool isCircular;

  const GlobalLogo({super.key, this.size = 114, this.isCircular = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircular ? null : BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius:
            isCircular
                ? BorderRadius.circular(size / 2)
                : BorderRadius.circular(8),
        child: Image.asset(
          'assets/atria_logo.jpg',
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: size,
              height: size,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size * 0.4,
                    height: size * 0.3,
                    decoration: const BoxDecoration(color: Color(0xFFE31E24)),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: size * 0.15,
                    ),
                  ),
                  SizedBox(height: size * 0.05),
                  Text(
                    'ATRIA POWER',
                    style: TextStyle(
                      fontSize: size * 0.08,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFE31E24),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class GlobalFeatureTag extends StatelessWidget {
  final String text;

  const GlobalFeatureTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Red bullet point
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: Color(0xFFE31E24),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        // Feature text
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFFB0B0B0),
            fontSize: 13,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

class GlobalText extends StatelessWidget {
  final String text;
  final double? s;
  final FontWeight? w;
  final Color? c;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;

  const GlobalText(
    this.text, {
    super.key,
    this.s,
    this.w,
    this.c,
    this.align,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Mulish', // Using the registered Mulish font
        fontSize: s ?? 14,
        fontWeight: w ?? FontWeight.w400,
        color: c ?? Colors.black,
      ),
    );
  }
}
