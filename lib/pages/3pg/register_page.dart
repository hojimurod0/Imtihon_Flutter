import 'package:flutter/material.dart';
import 'package:imtihonim_2/pages/3pg/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  String name = "";
  String email = "";
  String password = "";
  String passwordConfirm = "";

  String get userError => "";

  void register() {
    if (formKey.currentState!.validate()) {
      //! ma'lumotlarni saqlaymiz keyn  ro'yxatdan o'tkazamiz
      formKey.currentState!.save();

      Map<String, dynamic> user = {
        "name": name,
        "email": email,
        "password": password,
        "passwordConfirm": passwordConfirm,
      };

      Navigator.of(context).pop(user);
    }
  }

  // !imsni teshiramiz
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos ism kiriting";
    } else if (value.length < 4) {
      return "Iltimos uzunroq ism kiriting";
    }

    return null;
  }

  // !pochtani
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos elektron pochta kiriting";
    } else if (!value.contains("@") ||
        !value.substring(value.indexOf("@")).contains(".")) {
      return "To'g'ri elektron pochta kiriting";
    }

    return null;
  }

// !Parol
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos parol kiriting";
    } else if (value.length < 8) {
      return "Iltimos eng kamida 8ta element kiriting";
    }

    return null;
  }

  String? validatePasswordConfirm(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos parolni tasdiqlang";
    } else if (value != passwordController.text) {
      return "Parollar mos kelmadi";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                const Text(
                  "Create your account ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (userError.isNotEmpty)
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        userError,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7583CA),
                      foregroundColor: Color.fromARGB(255, 242, 243, 247),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook, color: Colors.white),
                        SizedBox(width: 30),
                        const Text("CONTINUE WITH FACEBOOK"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 249, 250),
                        foregroundColor: const Color.fromARGB(255, 16, 16, 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/google.png"),
                          SizedBox(width: 30),
                          const Text("CONTINUE WITH GOOGLE"),
                        ],
                      )),
                ),
                SizedBox(height: 40),
                const Text(
                  "OR LOG IN WITH EMAIL",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Ism",
                    labelText: "Ism",
                  ),
                  validator: validateName,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      name = newValue;
                    }
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Elektron pochta",
                    labelText: "Elektron pochta",
                  ),
                  validator: validateEmail,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      email = newValue;
                    }
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Parol",
                    labelText: "Parol",
                  ),
                  validator: validatePassword,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      password = newValue;
                    }
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 35),
                    const Text(
                      "I have read the Privacy Policy",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF07583CA),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: const Text("RO'YXATDAN O'TISH"),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text("ALREADY HAVE AN ACCOUNT? SIGN IN"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
