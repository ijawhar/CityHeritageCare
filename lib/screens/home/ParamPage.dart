
import 'package:flutter/material.dart';
class ParamPage extends StatefulWidget{
  @override
  _ParamPageState createState() => _ParamPageState();

}

class _ParamPageState extends State<ParamPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    username.text = ""; //innitail value of text field
    password.text = "";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    String? localisation;

    return  Scaffold(
        appBar: AppBar(
          title: Text("Paramétrage utilisateur"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: "Email", //babel text
                    hintText: "Entrer Votre email", //hint text
                    prefixIcon: Icon(Icons.people), //prefix iocn
                    hintStyle: TextStyle(fontSize: 15), //hint text style
                    labelStyle: TextStyle(fontSize: 13, color: Colors.redAccent), //label style
                  )
              ),
              TextField(
                  controller: password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Mot de passe actuel",
                    hintText: "Entrer votre mot de passe",
                    hintStyle: TextStyle(fontSize: 15),
                    labelStyle: TextStyle(fontSize: 13, color: Colors.redAccent),
                  )
              ),
              TextField(
                  controller: password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Nouveau Mot de passe",
                    hintText: "Entrer votre mot de passe",
                    hintStyle: TextStyle(fontSize: 15),
                    labelStyle: TextStyle(fontSize: 13, color: Colors.redAccent),
                  )
              ),
              Container(height:20),
              Text("Voulez vous activer la localisation ?", style: TextStyle(
                  fontSize: 18, color: Colors.blue
              ),
              ),
              RadioListTile(
                title: Text("Oui"),
                value: "oui",
                groupValue: localisation,
                onChanged: (value){
                  setState(() {
                    localisation = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Non"),
                value: "non",
                groupValue: localisation,
                onChanged: (value){
                  setState(() {
                    localisation = value.toString();
                  });
                },
              ),
              ElevatedButton(
                child: Text(
                  'Soumettre',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                onPressed: () {},
              )

            ],
          ),
        )
    );
  }
}