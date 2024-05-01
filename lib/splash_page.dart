import 'package:app_first_may/login_page.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  void _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
  }

@override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("hello there",style: const TextStyle(fontSize: 50),)),
    );
  }

}
