import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//Eger coklu bir animasyon yapsaydik TickerProviderMixin yazardik.
class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,  //vsync this diyerek bu sınıfta yapildigini belirttik. vsync ozelligi ise baslangic bitis gibi durumları guncel kalmasini saglamak
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller!);

    controller?.forward();

    controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {  //Welcome screen yok oldugunda veya oradan ayrildiginda hafizada animation' a yer ayirmamasi icin dispose yaptık
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red.withOpacity(controller!.value),  opaklıktan bir anda ekran parlayrak kırmızı oluyor. Ama bunun olması icin addListener' a setState eklemeyi unutma
      backgroundColor: animation!.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',    //Logoya gecis ozelligi kazandirildi. Burasi baslangic yeri. tag baslangic ve sonu bulmak icin yaziliyor
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts : [
                    TyperAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade800,
                      ),
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: (){Navigator.pushNamed(context, LoginScreen.id);},
            ),
            RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: (){Navigator.pushNamed(context, RegistrationScreen.id);},
            ),
          ],
        ),
      ),
    );
  }
}




