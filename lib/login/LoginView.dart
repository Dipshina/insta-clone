import 'package:flutter/material.dart';
import 'package:my_application/instaClone/insta.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _hide = true;
  TextEditingController  _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login!', 
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900 ),),
          Container(
            margin: EdgeInsets.all(12),
            child: Form(
              key : _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _username,
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text('Username'),
                      filled: true,
                      prefix: Icon(Icons.person),
                      fillColor: Colors.grey.shade100,
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                      controller: _password,
                      validator: (value){
                      if (value == null || value.isEmpty){
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    obscureText: _hide,
                    decoration: InputDecoration(
                      label: Text('Password'),
                      filled: true,
                      prefix: Icon(Icons.password),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _hide=!_hide;
                          });
                        },
                        child: _hide?Icon(Icons.visibility_off):Icon(Icons.visibility)),
                      fillColor: Colors.grey.shade100,
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()){
                      if(_username.text=='admin' && _password.text=='admin'){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const Insta()));
                      }else{
                        const snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Password or Username is incorrect.'),
                           );
                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }}, child: Text("Login"))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}