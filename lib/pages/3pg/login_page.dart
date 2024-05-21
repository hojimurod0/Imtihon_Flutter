import 'package:flutter/material.dart';
import 'package:imtihonim_2/pages/fifty_page.dart';
import 'package:imtihonim_2/pages/3pg/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, dynamic>? user;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? emailError;
  String? passwordError;
  String userError = "";
  bool isChecked = false;

  void login() {
    // !tekshirish
    validateEmail();
    validatePassword();

    // !  Agar email va parol xato o'lmasa
    if (emailError == null && passwordError == null) {
      //!  Foydalanuvchi mavjudligini tekshirish
      if (user == null) {
        userError = "Foydalanuvchi topilmadi, iltimos ro'yxatdan o'ting";
        setState(() {});
      } else {
        //! Email va parol to'g'ri bo'lsa
        if (user!['email'] == emailController.text &&
            user!['email'] != null &&
            user!['password'] == passwordController.text) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => FiftyPage(),
            ),
          );
        } else {
          userError = "Email yoki parol xato";
          setState(() {});
        }
      }
    }
  }

  //! Emailni tekshirish
  void validateEmail() {
    String email = emailController.text;

    setState(() {
      if (email.isEmpty) {
        emailError = "Iltimos elektron pochta kiriting";
      } else if (!email.contains("@") ||
          !email.substring(email.indexOf("@")).contains(".")) {
        emailError = "To'g'ri elektron pochta kiriting";
      } else {
        emailError = null;
      }
    });
  }

  //! Parolni tekshirish
  void validatePassword() {
    String password = passwordController.text;

    setState(() {
      if (password.isEmpty) {
        passwordError = "Iltimos parol kiriting";
      } else {
        passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 130), 
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (userError.isNotEmpty)
                Column(
                  children: [
                    const SizedBox(height: 20), 
                    Text(
                      userError,
                      style:
                          const TextStyle(color: Color.fromARGB(255, 11, 3, 2)),
                    ),
                  ],
                ),
              SizedBox(height: 30), 
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7583CA),
                    foregroundColor: Color.fromARGB(255, 242, 243, 247),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), 
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook, color: Colors.white),
                      SizedBox(width: 30), 
                      Text("CONTINUE WITH FACEBOOK"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30), 
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: login,
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
                      Text("CONTINUE WITH GOOGLE"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40), // Bo'sh joy
              const Center(
                child: Text(
                  "OR LOG IN WITH EMAIL",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Elektron pochta",
                  errorText: emailError,
                ),
                onChanged: (value) {
                  validateEmail();
                },
              ),
              const SizedBox(height: 30),
              TextField(
                controller: passwordController,
                obscureText: true, //! not see
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Parol",
                  errorText: passwordError,
                ),
                onChanged: (value) {
                  validatePassword();
                },
                onSubmitted: (value) {
                  login();
                },
              ),
              const SizedBox(height: 10),
              Card(
                child: TextButton(
                  onPressed: () async {
                    emailController.text.isEmpty
                        ? validateEmail()
                        : user = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) {
                                return FiftyPage();
                              },
                            ),
                          );
                    print(user);
                    if (user != null) {
                      setState(() {});
                    }
                  },
                  child: const Text("Log in"),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  user = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return RegisterPage();
                      },
                    ),
                  );
                  print(user);
                  if (user != null) {
                    setState(() {});
                  }
                },
                child: const Text("FORGOT PASSWORD?"),
              ),
              SizedBox(height: 90), // Bo'sh joy
              const Center(
                child: Text(
                  "DON’T HAVE AN ACCOUNT? SIGN UP",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
