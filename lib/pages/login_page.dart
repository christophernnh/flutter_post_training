import 'package:flutter/material.dart';
import 'package:cn23_2_qualification/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //drop down
  List<String> countryList = ["Choose", "Indonesia", "Singapore", "Malaysia", "Thailand"];
  String selectedCountry = "Choose";

  //text fields
  TextEditingController emailController = 
  TextEditingController();
  String? emailError;

  TextEditingController passwordController = 
  TextEditingController();
  String? passwordError;

  // checkbox vars
  bool isAgree = false;

  //login

  void resetError(){
    setState(() {
      emailError = null;
      passwordError = null;
    });
  }

  void handleLogin(){
    resetError();
    String username = emailController.text;
    String password = passwordController.text;

    if(username.isEmpty){
      setState(() {
        emailError = "E-mail required";
      });

      SnackBar snackBar = const SnackBar(
        content: Text("Please fill in your email"),
        duration: Duration(seconds: 1),
        backgroundColor: Color.fromRGBO(255, 90, 90, 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if(password.isEmpty){
      setState(() {
        passwordError = "Password required";
      });

       SnackBar snackBar = const SnackBar(
        content: Text("Please fill in your password"),
        duration: Duration(seconds: 1),
        backgroundColor: Color.fromRGBO(255, 90, 90, 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if(selectedCountry == "Choose"){
      SnackBar snackBar = const SnackBar(
        content: Text("Please fill in your region/country."),
        duration: Duration(seconds: 1),
        backgroundColor: Color.fromRGBO(255, 90, 90, 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if(!isAgree){
      SnackBar snackBar = const SnackBar(
        content: Text("Please agree to terms & conditions is required."),
        duration: Duration(seconds: 1),
        backgroundColor: Color.fromRGBO(255, 90, 90, 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    //move pages here
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (context){
        return MainPage(username: username);
      }), 
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  title: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //             Image.asset(
      //            'assets/toyotalogo.png',
      //             fit: BoxFit.contain,
      //             height: 45,
      //         ),
      //       ],

      //     ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title image
                const SizedBox(height: 80),
                Center(child: Image.asset("assets/toyotalogobig.png", height: 170,)),
                const SizedBox(height: 100),

                //country dropdown
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Country / Region",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DropdownButton(
                          value: selectedCountry,
                          items: countryList
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCountry = value!;
                            });
                          },
                          underline: Container(), // Remove default underline
                          dropdownColor: Colors.white,
                          icon: const Icon(Icons.arrow_drop_down), // Dropdown icon
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 5),
                //E-mail field
                TextField(
                  controller: emailController,
                  decoration:  InputDecoration(
                    errorText : emailError,
                    hintText: "Email",
                    labelText: "Email",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                    ),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    
                  ),
                ),

                const SizedBox(height: 5),

                //Password Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration:  InputDecoration(
                    errorText : passwordError,
                    hintText: "Password",
                    labelText: "Password",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                    ),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),


                 //Checkbox
                CheckboxListTile(
                  contentPadding: const EdgeInsets.only( top: 20, bottom: 5),
                  activeColor: const Color.fromARGB(255, 248, 78, 78),
                  title: const Text("Agree to the T&C.", style: TextStyle(fontSize: 14),),
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: const Icon(Icons.verified_user),
                  value: isAgree, 
                  onChanged: (value) {
                    setState(() {
                      isAgree = value!;
                    });
                  },
                ),

                //Button
                Center(
                  child: Container(
                    width: 300,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: (){handleLogin();},
                      child: const Text("Login"),
                    ),
                  ),
                ),


              ],
          )
        ),
      ),
    );
  }
}