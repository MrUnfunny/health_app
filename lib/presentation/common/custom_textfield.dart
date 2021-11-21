import 'package:flutter/material.dart';
import '../../config/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.onChanged,
    required this.inputType,
    required this.isPassword,
    required this.text,
    this.validator,
    this.errorText,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextInputType inputType;
  final bool isPassword;
  final Function onChanged;
  final bool Function(String)? validator;
  final String? errorText;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool iconVisibility = false;
  bool visibleIcon = false;

  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller
      ..clear()
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        widget.onChanged(value);
      },
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: ThemeColors.grey),
        errorText: (widget.validator != null &&
                !((widget.validator != null)
                    ? widget.validator!(controller.text)
                    : false))
            ? widget.errorText
            : null,
        suffix: (iconVisibility)
            ? (visibleIcon)
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        visibleIcon = !visibleIcon;
                      });
                    },
                    child: Icon(
                      Icons.visibility,
                      color: ThemeColors.lightMainAccentColor,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        visibleIcon = !visibleIcon;
                      });
                    },
                    child: const Icon(
                      Icons.visibility_off,
                      // color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
            : null,
      ),
      keyboardType: widget.inputType,
      obscureText: (widget.isPassword)
          ? (visibleIcon)
              ? false
              : true
          : false,
      onTap: () {
        setState(() {
          if (widget.isPassword == true) {
            iconVisibility = true;
          }
        });
      },
    );
  }
}
