import 'package:fl_logindemo/models/loginuser.dart';
import 'package:fl_logindemo/services/auth.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget{

  final Function? toggleView;
   Register({this.toggleView});

   @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register>{
  final AuthService _auth = new AuthService();
  bool isConditionsValidated  = false;


  bool _obscureText = true;
  final _email = TextEditingController();
  final _pseudo = TextEditingController();
  final _password = TextEditingController();
  bool isChecked = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var Inscription = Material(
      elevation: 5.0,
      child: Text(
        "Inscription",
        style: TextStyle(color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );

  final emailField = TextFormField(
        controller: _email,
        autofocus: false,
        validator: (value) {
          if (value != null) {
            if (value.contains('@') && value.endsWith('.com')) {
              return null;
            }
            return 'Entrez une adresse mail valide';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            prefixIcon: Icon(Icons.email),
            hintText: "Email",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));


  final pseudo = TextFormField(
      controller: _pseudo,
      autofocus: false,
      validator: (value) {
        if (value != null) {
          if (value.isNotEmpty ){
            return null;
          }
          return 'Entrez un pseudo valide';
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: Icon(Icons.supervised_user_circle),
          hintText: "Pseudo",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));




  final passwordField = TextFormField(
        obscureText: _obscureText,
        controller: _password,
        autofocus: false,
        validator: (value) {
         if (value == null || value.trim().isEmpty) {
                            return 'Ce champ est requis';
                          }
                          if (value.trim().length < 8) {
                            return 'Le password doit comporter au moins 8 caractères';
                          }
                          // Return null if the entered password is valid
                          return null;
        } ,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            prefixIcon: Icon(Icons.lock),

            hintText: "mot de passe",

            suffixIcon: IconButton(icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),

            onPressed: (){
              setState(() {
                _obscureText = !_obscureText;
              });
            },),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));


    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,

      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
              dynamic result = await _auth.registerEmailpassword(LoginUser(email: _email.text,password: _password.text));
               if (result.uid == null) { //null means unsuccessfull authentication
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(result.code),
                      );
                    });
          }
          }
        },



        child: Text(
          "C'est parti !",
          style: TextStyle(color: Theme.of(context).primaryColorLight, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );



   return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text('Page d\'inscription'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Inscription,
                const SizedBox(height: 120.0),
                pseudo,
                const SizedBox(height: 25.0),
                emailField,
                const SizedBox(height: 25.0),
                passwordField,
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: isChecked, onChanged: (bool? v) {
                      setState((){
                        print(v);
                        isChecked = v!;
                      });
                    },),
                    Text("Accepter les conditions d'utilisation")
                  ],
                ),
                const SizedBox( height: 35.0),
                registerButton,
                const SizedBox(height: 15.0),
                GestureDetector(
                  onTap: (){
                    widget.toggleView!();
                  },
                  child: Text("Vous avez déjà un compte ?\nConnectez-vous", textAlign: TextAlign.center, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        ),
      ],
    ),
    );
  }
}