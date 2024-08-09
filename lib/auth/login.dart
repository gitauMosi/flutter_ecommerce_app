import 'package:eco_app/constants/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  String? validateUser(value){
     if(value == null || value.isEmpty){
         return "Please enter Email";
       }
      return null;
  }
  String? validatePassword(value) {
    if(value == null || value.isEmpty){
      return "Enter correct password";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Form(
        key: _formKey,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.red,
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    elevation: 10,
                  ),
                ),
                const Spacer(),
              ],
            ),
            SafeArea(
                child: ListView(
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
                const Text(
                  "Already have an account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Card(
                  margin: const EdgeInsets.all(32.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Log In",
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.red,
                                ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      //>>>>>>>>Todo
                      TextFormField(
                        controller: userController,
                        decoration:
                            const InputDecoration(labelText: "Enter username"),
                        validator: validateUser
                      ),
                      TextFormField(
                        controller: pwdController,
                        obscureText: true,
                        decoration:
                            const InputDecoration(labelText: "Enter Password"),
                        validator: validatePassword,
                      ),
        
                      //>>>>>>>>>>>>
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          //navigate to signUp
                        },
                        child: const Text("Create Account", textAlign: TextAlign.right,),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        
                        onPressed: () {
                          //validate input
                          //login
                          if(_formKey.currentState!.validate()){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Proccessing Data")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.all(16.0),
                        ),
                        child: const Text("SUBMIT", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                           ),),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(fontSize: 16.0, color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
