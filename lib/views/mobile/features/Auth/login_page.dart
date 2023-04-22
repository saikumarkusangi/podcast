import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/common/common.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/controllers/button_hover.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/views/web/features/features.dart';
import 'package:flutter_application_1/views/web/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/widgets.dart';

class MobileLoginPage extends ConsumerWidget {
  MobileLoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void login(String email, String password) {
      ref.watch(authProvider).signWithEmailAndPassword(email, password,context);
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: LightThemes.backgroundColor,
        endDrawer: const MobileDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme:const IconThemeData(
              size: 32,
              color: Colors.white
            ),
            automaticallyImplyLeading: false,
            leadingWidth: displayWidth(context) * 0.4,
            leading: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.network(
                            'https://ik.imagekit.io/eztaheq5g/490-4901480_podcastlogo-logo-image-podcast-png-transparent-png-removebg-preview.png?updatedAt=1682135735565',
                            color: Colors.white,
                          ),
            )),
        body: Container(
          width: displayWidth(context),
          height: displayHeight(context),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://ik.imagekit.io/eztaheq5g/abstract-black-white-grid-striped-260nw-1444575980.webp?updatedAt=1682194244133',
                  ),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  
                  height: displayHeight(context),
                  decoration: BoxDecoration(
                    
                    
                      borderRadius: BorderRadius.circular(20)),
                  width: displayWidth(context) ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                            fontWeight: FontWeight.bold, fontSize: 34),
                      ).animate().moveX(
                          begin: -displayWidth(context) / 1.2,
                          delay: 200.ms),
                           const SizedBox(height: 20,),
                      SizedBox(
                        height: 150,
                        width: displayWidth(context),
                        child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              CommonTextField(
                                color: Colors.white,
                                width: displayWidth(context) ,
                                 borderside: Colors.white54,
                                controller: emailController,
                                hintText: 'Enter your email',
                                ispass: false,
                                type: TextInputType.emailAddress,
                              ),
                              CommonTextField(
                                color: Colors.white,
                                width:  displayWidth(context),
                                   borderside: Colors.white54,
                                controller: passwordController,
                                hintText: 'Enter your password',
                                ispass: true,
                                type: TextInputType.text,
                              ),
                            ]),
                      ).animate().moveX(
                          begin: -displayWidth(context) / 1.2,
                          delay: 300.ms),
                           const SizedBox(height: 20,),
                      SizedBox(
                        height: 60,
                        width: displayWidth(context),
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
                              width: displayWidth(context),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png",
                                    width: 40,
                                  ),
                                  const Text(
                                    "Login with Google",
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
                          const SizedBox(height: 20,),
                      SizedBox(
                        height: 50,
                        width: displayWidth(context) ,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (event) => ref
                              .read(buttonhoverProvider.notifier)
                              .hovered(true),
                          onExit: (event) => ref
                              .read(buttonhoverProvider.notifier)
                              .hovered(false),
                          child: InkWell(
                            onTap: () {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                login(emailController.text,
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
                              width: displayWidth(context) ,
                              
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                " Login ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ).animate().moveX(
                          begin: -displayWidth(context) / 1.2,
                          delay: 400.ms),
                           const SizedBox(height: 20,),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                              children: [
                            const TextSpan(
                                text: "Don't have an account ? "),
                            TextSpan(
                              
                                text: "Create one",
                                style: const TextStyle(
                                  color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => WebSignUpPage())))
                          ])).animate().moveX(
                          begin: -displayWidth(context) / 1.2,
                          delay: 500.ms),
                    ],
                  ),
                ).animate().moveX(
                    begin: -displayWidth(context) / 1.2, delay: 100.ms),
                
                const WebFooter()
              ]),
            ),
          ),
        ));
  }
}
