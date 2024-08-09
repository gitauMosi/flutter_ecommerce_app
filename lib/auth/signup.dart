import 'package:eco_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}
  
class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
   
   String? validateEmail(value){
     if(value == null || value.isEmpty){
      return "Enter correct email";
     }
     return null;
  }
  String? validateUser(value){
     if(value == null || value.isEmpty){
      return "Enter correct username";
     }
     return null;
  }
  String? validatePassword(value){
     if(value == null || value.isEmpty){
      return "Enter correct Password";
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
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
                const Text(
                  "Create An Account",
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
                        "Sign Up",
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
                        validator: validateUser,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration:
                            const InputDecoration(labelText: "Enter Email"),
                        validator: validateEmail,
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
                        onTap: () {},
                        child: const Text("Already have account!", textAlign: TextAlign.end,),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
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
                        child: const Text("Sign Up", style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                           ),),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextButton(
                        onPressed: () {
                         //navigate to login page
                        },
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
