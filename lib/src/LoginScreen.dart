import 'package:flutter/material.dart';
import 'package:login/blocs/provider.dart';
import 'package:login/blocs/bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          'WHATSAPP',
          style: TextStyle(
            letterSpacing: 2.0
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            padding: EdgeInsets.all(25.0),
            children: <Widget>[
              Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                child:Text('Hi there!',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white
                ),)
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                child: Text(
                  'Email Address',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
                height: 7.0,
              ),
              emailInput(bloc),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
                height: 7.0,
              ),
              passInput(bloc),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgotten Password?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              button(bloc),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Create an Account? SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailInput(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.updateEmail,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            errorText: snapshot.error,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            hintText: 'you@example.com',
            fillColor: Colors.white,
            filled: true,
          ),
        );
      },
    );
  }

  bool show = true;
  void isHidden() {
    setState(() {
      show = !show;
    });
  }

  Widget passInput(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.updatePassword,
          obscureText: show ? true : false,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            errorText: snapshot.error,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            suffixIcon: IconButton(
                icon: Icon(
                  (show ? Icons.visibility_off : Icons.visibility),
                  color: Colors.grey,
                ),
                onPressed: isHidden),
            fillColor: Colors.white,
            filled: true,
            hintText: 'Password',
          ),
        );
      },
    );
  }

  Widget button(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text(
            'SUBMIT',
            style: TextStyle(color: Colors.white, letterSpacing: 5.0),
          ),
          color: Colors.blueGrey,
          padding: EdgeInsets.all(15.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}
