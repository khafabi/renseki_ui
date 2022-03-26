import 'package:flutter/material.dart';
import 'package:renseki_ui/util/app_color.dart';
import 'package:renseki_ui/util/app_font.dart';

class RensekiPasswordForm extends StatefulWidget {
  const RensekiPasswordForm({
    Key? key,
    required this.title,
    required this.textController,
    required this.hintText,
    this.validatorFunction,
  }) : super(key: key);

  final String title;
  final TextEditingController textController;
  final String hintText;
  final String? Function(String?)? validatorFunction;

  @override
  State<RensekiPasswordForm> createState() => _RensekiPasswordFormState();
}

class _RensekiPasswordFormState extends State<RensekiPasswordForm> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: AppFonts.verySmall(
              fontWeight: FontWeight.bold,
              color: ColorConst.black1Color,
            ),
          ),
        ),
        Container(
          height: const Size.fromHeight(45).height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorConst.neutral20WhiteColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: !_passwordVisible,
                  controller: widget.textController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    contentPadding:  EdgeInsets.only(left: 15,),
                    hintStyle: AppFonts.verySmall(
                      color: ColorConst.neutral50WhiteColor,
                    ),
                  ),
                  validator: widget.validatorFunction,
                ),
              ),
              IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: setVisibility,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void setVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
}
