import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormPage(),
    );
  }
  class FormPage extends StatelessWidget {

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Container(
                //alignment: FractionalOffset.topCenter,
                //padding: EdgeInsets.all(30),
                child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: Text("Localisation",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      Flexible(
                          child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.location_city),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: Text("Déscription du lieu",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      Flexible(
                          child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                            //fillColor: Colors.blueGrey,
                            ),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: Text("Insérer photo",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      Flexible(
                          child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.image),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )

                            //fillColor: Colors.blueGrey,
                            ),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: Text("Ampleur",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(children: [
                            Row(children: [
                              Radio(
                                value: 1,
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value = (int) as int;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text("Beaucoup"),
                            ]),
                            Row(children: [
                              Radio(
                                value: 2,
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value = (int) as int;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text("Moyen      "),
                            ]),
                            Row(children: [
                              Radio(
                                value: 3,
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value = (int) as int;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text("peu          "),
                            ])
                          ]))
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green[300],
                        child: MaterialButton(
                          //minWidth: MediaQuery.of(context).,
                          elevation: 12.0,

                          onPressed: () {},
                          child: const Text("Confirmer",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        )))
              ],
            ))
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
}
