import 'package:flutter/material.dart';

class login extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Color(0xFF0A0E21),
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 48.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: ListView(
              children: [
                Image(
                  image: AssetImage('assets/love2.png'),
                  width: 125.0,
                  height: 125.0,
                ),
                SizedBox(
                  height: 30.0,

                ),
                Center(child: Text('Login',style: TextStyle(fontSize: 24.0,color: Colors.red,fontWeight: FontWeight.bold),)),
                Container(
                  child: Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic),
                          keyboardType: TextInputType.text,
                          controller: userNameController,
                          decoration: InputDecoration(
                            labelText: "Enter Your name",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "Mamun",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
                Container(
                  child: Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic),
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "12157",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ dashboard');
                      },
                      icon: Icon(
                        Icons.image,
                      ),
                      label: Text(
                        "login",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        reset();
                      },
                      label: Text(
                        'reset',
                        style: TextStyle(color: Colors.black),
                      ),
                      icon: Icon(Icons.add_card),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )

    );
  }
  void reset() {
    userNameController.text = '';
    passwordController.text = '';
  }
}
