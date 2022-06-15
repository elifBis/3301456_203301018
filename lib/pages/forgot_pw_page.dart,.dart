import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
   try{
     await FirebaseAuth.instance.sendPasswordResetEmail(
         email: _emailController.text.trim());
     showDialog(
         context: context,
         builder: (context){
           return AlertDialog(
             content: Text('Şifre sıfırlama kodun gönderildi. Lütfen emailini kontrol et!'),
           );
         });
   } on FirebaseAuthException catch(e){
     print(e);
     showDialog(
         context: context,
         builder: (context){
           return AlertDialog(
             content: Text(e.message.toString()),
           );
         });
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey ,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/sifre.png'),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'Sana kod gönderebilmemiz için email\'ini girmen gerek',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Email'),
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: passwordReset,
            child: Text("Şifreyi sıfırla"),
            color: Colors.blueGrey[100]
          ),
        ],
      ),
    );
  }
}
