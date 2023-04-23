import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/common/common.dart';
import 'package:flutter_application_1/controllers/button_hover.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/views/web/features/features.dart';
import 'package:flutter_application_1/views/web/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../controllers/auth_controller.dart';

class WebSignUpPage extends ConsumerWidget {
   WebSignUpPage({super.key});
   final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void createAccount(String email, String password) {
      ref.watch(authProvider).createNewAccoutWithEmailAndPassword(email, password,context);
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: LightThemes.backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size(displayWidth(context), 60),
            child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.network(
                              'https://ik.imagekit.io/eztaheq5g/490-4901480_podcastlogo-logo-image-podcast-png-transparent-png-removebg-preview.png?updatedAt=1682135735565',
                              color: Colors.white,
                              width: displayWidth(context) / 6),
                ),),
        body: Container(
          width: displayWidth(context),
          height: displayHeight(context),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://www.shutterstock.com/image-vector/abstract-black-white-grid-striped-260nw-1444575980.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: displayHeight(context) / 1.5,
                      decoration: BoxDecoration(
                        boxShadow:const [
                          BoxShadow(color: Colors.white54,
                          spreadRadius: 8,
                          blurRadius: 100,
                          offset: Offset(10, 20)
                          )
                        ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      width: displayWidth(context) / 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        const  Text(
                            "New Account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 34),
                          ).animate().moveX(
                              begin: -displayWidth(context) / 1.2,
                              delay: 200.ms),
                           SizedBox(
                            
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                  CommonTextField(
                                    padding: 50,
                                    color: Colors.black,
                                    width:  displayWidth(context) / 4,
                                    borderside: Colors.black45,
                                    controller:emailController ,
                                    hintText: 'Enter your email',
                                    ispass: false,
                                    type: TextInputType.emailAddress,),
                      
                        CommonTextField(
                          padding: 50,
                          color: Colors.black,
                          width:  displayWidth(context) / 4,
                           borderside: Colors.black45,
                          controller: passwordController,
                          hintText: 'Enter your password',
                          ispass: true,type: TextInputType.text,),
                            ])
                            ,
                          ).animate().moveX(
                              begin: -displayWidth(context) / 1.2,
                              delay: 300.ms),
                              SizedBox(
                            height: 60,
                            width: displayWidth(context) / 4,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              onEnter: (event) => ref
                                  .read(buttonhoverProvider.notifier)
                                  .hovered(true),
                              onExit: (event) => ref
                                  .read(buttonhoverProvider.notifier)
                                  .hovered(false),
                              child: InkWell(
                                child: Container(
                                  width: displayWidth(context) / 4,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network("https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png",width: 40,),
                                     const  Text(
                                        "Signup with Google",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ).animate().moveX(
                              begin: -displayWidth(context) / 1.2,
                              delay: 400.ms),
                   
                          SizedBox(
                            height: 60,
                            width: displayWidth(context) / 4,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              onEnter: (event) => ref
                                  .read(buttonhoverProvider.notifier)
                                  .hovered(true),
                              onExit: (event) => ref
                                  .read(buttonhoverProvider.notifier)
                                  .hovered(false),
                              child: InkWell(
                                onTap: (){
                                  if (emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty) {
                                    createAccount(emailController.text,
                                        passwordController.text);
                                  } else {
                                    customSnackBar(
                                        context,
                                        'Oh snap!',
                                        'Email and Password cannot be empty',
                                        ContentType.failure);
                                  }
                                },
                                child: Container(
                                  width: displayWidth(context) / 4,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child:const Text(
                                    " Create ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ).animate().moveX(
                              begin: -displayWidth(context) / 1.2,
                              delay: 400.ms),

                          RichText(text: TextSpan(
                        style:const TextStyle(color: Colors.black,fontSize: 18),
                            children: [
                            const  TextSpan(text: "Already have an account ? "),
                              TextSpan(text: "Login",style:const TextStyle(fontWeight: FontWeight.w600),recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (_)=> WebLoginPage())))
                            ]
                          )).animate().moveX(
                              begin: -displayWidth(context) / 1.2,
                              delay: 500.ms),
                        ],
                      ),
                    ).animate().moveX(
                              begin: -displayWidth(context) / 1.2,
                              delay: 100.ms),
                    SizedBox(
                        width: displayWidth(context) / 2.1,
                         height: displayHeight(context) * 0.85,
                        child: Image.network(
                          "https://allogy.com/wp-content/uploads/2021/06/podcast.png",
                          fit: BoxFit.contain,
                        ))
                  ],
                ),
                const WebFooter()
              ]),
            ),
          ),
        ));
  }
}
