import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/common/common.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/views/web/features/Profile/profile_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../controllers/hover_controller.dart';
import '../../../web/widgets/auth_widget.dart';
import '../../../web/widgets/footer.dart';
import '../../widgets/widgets.dart';

class MobileLandingPage extends ConsumerWidget {
  const MobileLandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ishover = ref.watch(hoverProvider);
        final currentTab = ref.watch(currentTabProvider);
    return GestureDetector(
      onTap: () =>
          ishover == 4 ? ref.watch(hoverProvider.notifier).hovered(currentTab) : null,
      child: Scaffold(
         
          extendBodyBehindAppBar: true,
          backgroundColor: LightThemes.backgroundColor,
          endDrawer: const MobileDrawer(),
          appBar: AppBar(
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
                      ),
                    
            backgroundColor: Colors.black,
          ),
          // appBar: PreferredSize(
          //     preferredSize: Size(displayWidth(context), 60),
          //     child: ref.watch(authStateChangeProvider).when(
          //         loading: () => const Center(
          //               child: CircularProgressIndicator(),
          //             ),
          //         error: (e, tr) => Center(
          //               child: Text(e.toString()),
          //             ),
          //         data: (user) {
          //           if (user != null) {
          //             // return const CustomAppBar()
          //             //     .animate()
          //             //     .fadeIn(delay: 500.ms);
          //           }
          //           return Align(
          //             alignment: Alignment.centerLeft,
          //             child: Padding(
          //               padding: const EdgeInsets.only(left: 10),
          //               child: Image.network(
          //                   'https://ik.imagekit.io/eztaheq5g/490-4901480_podcastlogo-logo-image-podcast-png-transparent-png-removebg-preview.png?updatedAt=1682135735565',
          //                   color: Colors.white,
          //                   width: displayWidth(context) / 3),
          //             ),
          //           );
          //         })),
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
              child: Stack(
                children: [
                  ishover == 4
                      ? const Positioned(
                          top: 50, right: 0, child: WebProfile())
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 60),
                    child: Column(children: [
                      Stack(
                        children: 
                                  [
                                    
                                    SizedBox(
                                  width: displayWidth(context) ,
                                  height: displayHeight(context) /2,
                                  child: Image.network(
                                    "https://ik.imagekit.io/eztaheq5g/original_36b7e4525d61d6cbf2a3139d38eccced.png?updatedAt=1682183290754",
                                    fit: BoxFit.contain,
                                  ))
                            .animate()
                            .moveX(
                                  begin: -displayWidth(context) / 1.2,
                                  delay: 100.ms),
                                ],
                      ),
                      SizedBox(
                        width: displayWidth(context) ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Discover better insight every single day",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: LightThemes.headingtextColor),
                                  textAlign: TextAlign.center,
                            ).animate().moveX(
                                begin: -displayWidth(context) / 1.2,
                                delay: 200.ms),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: displayWidth(context) ,
                              child: const Text(
                                "Discovered latest top-notch stories from world wide community.quality informative podcast and verified creaters.",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: LightThemes.subtextColor),
                                         textAlign: TextAlign.center,
                              ),
                            ).animate().moveX(
                                begin: -displayWidth(context) / 1.2,
                                delay: 300.ms),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: SizedBox(
                                  
                                  width: displayWidth(context) ,
                                  child:
                                      ref.watch(authStateChangeProvider).when(
                                          data: (user) {
                                            if (user == null) {
                                              return Center(
                                                child: MouseRegion(
                                                  cursor: SystemMouseCursors
                                                      .click,
                                                  child: InkWell(
                                                    onTap: () {
                                                     
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 5,
                                                              vertical: 15),
                                                      color: Colors.white,
                                                      child: const Text(
                                                        "Browse podcast ➔",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                                         textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            return const MobilAuthWidget();
                                          },
                                          error: (e, tr) => Center(
                                                child: Text(e.toString()),
                                              ),
                                          loading: () =>const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ))).animate().moveX(
                                  begin: -displayWidth(context) / 1.2,
                                  delay: 400.ms),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                     const WebFooter()
                    ]),
                  ),
                  
                ],
              ),
            ),
          )),
    );
  }
}
