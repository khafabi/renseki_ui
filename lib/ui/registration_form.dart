import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renseki_ui/ui/widget/renseki_password.dart';
import 'package:renseki_ui/ui/widget/renseki_textfield.dart';
import 'package:renseki_ui/util/app_color.dart';
import 'package:renseki_ui/util/app_font.dart';

class RegistrationWidget extends StatefulWidget {
  RegistrationWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
    /// Keys
  final GlobalKey<FormState> _registrationFormKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _referralController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registrationFormKey,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Spacer(),
                  Text(
                    'Registrasi',
                    style: AppFonts.standard(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Spacer()
                ],
              ),
              SvgPicture.asset(
                'assets/images/registrasi_1.svg',
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Silahkan mengisi data di bawah ini',
                  style: AppFonts.small(),
                ),
              ),

              /// Full Name
              RensekiTextForm(
                title: 'Nama Lengkap',
                textController: _fullNameController,
                hintText: 'Masukkan nama lengkap...',
                validatorFunction: validateFullName,
              ),

              /// Username
              RensekiTextForm(
                title: 'Username',
                textController: _usernameController,
                hintText: 'Masukkan username...',
                validatorFunction: validateUsername,
              ),

              /// Email
              RensekiTextForm(
                title: 'Email',
                textController: _emailController,
                hintText: 'Masukkan email...',
                validatorFunction: validateEmail,
              ),

              /// Phone
              RensekiTextForm(
                title: 'No. Handphone',
                textController: _phoneController,
                hintText: 'Cth. 082240003030',
                validatorFunction: validatePhone,
              ),

              /// Password
              RensekiPasswordForm(
                title: 'Password',
                textController: _passwordController,
                hintText: 'Masukkan password...',
                validatorFunction: validatePassword,
              ),

              /// Password Confirmation
              RensekiPasswordForm(
                title: 'Konfirmasi Password',
                textController: _passwordConfirmationController,
                hintText: 'Masukkan konfirmasi password...',
                validatorFunction: validateConfirmationPassword,
              ),

              ///Referral code
              RensekiTextForm(
                title: 'Kode Referral (Opsional)',
                textController: _referralController,
                hintText: '',
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorConst.rensekiBlue1,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      _registrationFormKey.currentState!.validate();
                    },
                    child: Text(
                      "Daftar",
                      style: AppFonts.small(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateConfirmationPassword(String? value) {
    if (value!.isEmpty) {
      return 'Please re-enter password';
    }
    if (_passwordController.text != _passwordConfirmationController.text) {
      return "Password does not match";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please a Enter Password';
    } else if (value.length < 8) {
      return 'Password is too short. It must contain at least 8 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'Nomor tidak boleh kosong';
    }
    if (!RegExp("^[0-9]").hasMatch(value)) {
      return 'Nomer tidak valid';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'Username tidak boleh kosong';
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]").hasMatch(value)) {
      return 'No space and special character';
    }
    return null;
  }

  String? validateFullName(String? value) {
    if (value!.isEmpty) {
      return 'Username tidak boleh kosong';
    }
    return null;
  }
}
