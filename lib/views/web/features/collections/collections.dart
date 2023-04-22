import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/common/sizes.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controllers/api_controller.dart';
import '../../../../models/categories_model.dart';

class Collections extends ConsumerWidget {
  final String background;
  final String category;
  const Collections({super.key, required this.background,required this.category});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final _data = ref.watch(collectionsProvider);
    return Scaffold(
      backgroundColor: LightThemes.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration:const BoxDecoration(
                  gradient: LinearGradient(
            colors: [
              Colors.white70,
               Colors.black54],
            begin:  FractionalOffset(0.0, 0.0),
            end:  FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
        ),
                ),
                
                width: displayWidth(context),
                height: displayHeight(context) / 3,
                child: Stack(children: [
                  Positioned(
                      left: 85,
                      
                    //  https://www.spiritshunters.com/wp-content/uploads/2018/06/vinyle-blanc.gif
                      child: Image.network(
                        'https://ik.imagekit.io/eztaheq5g/186-1868279_disc-record-retro-vinyl-audio-sound-music-retro-removebg-preview.png?updatedAt=1682192919269',
                        width: 200,
                      )).animate().moveX(begin: -100,delay: 200.milliseconds),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: displayWidth(context) * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(background),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(category,style:const TextStyle(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.white24,
                          blurRadius: 10,
                          offset: Offset(13, 10)
                        )
                      ],
                      fontWeight: FontWeight.w700,
                      fontSize: 62
                    ),),
                  ),
                //  Image.network('https://media0.giphy.com/media/TDlSjxwwM7WYqNf3fh/giphy.gif')
                ]),
              ),
            ),

              _data.when(
                  error: (e, tr) => Center(
                        child: Text(e.toString()),
                      ),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  data: (_data) {
                    List<CatergoriesModel> collections =
                        _data.map((e) => e).toList();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GridView.builder(
                          itemCount: collections.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4, childAspectRatio: 1.5),
                          itemBuilder: (context, index) {
                            String color = "0xFF${collections[index].color}";
                            return SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(int.parse(color)),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          Collections(
                                                            category: collections[index].name,
                                                              background:
                                                                  collections[
                                                                          index]
                                                                      .image)));
                                            },
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 20,
                                                  top: 20,
                                                  child: SizedBox(
                                                    width:
                                                        displayWidth(context) *
                                                            0.16,
                                                    child: Text(
                                                      collections[index].name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 28,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: -50,
                                                  bottom: -30,
                                                  child: RotationTransition(
                                                      turns:
                                                          const AlwaysStoppedAnimation(
                                                              20 / 360),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          child: Container(
                                                            color: Colors.red,
                                                            width: displayWidth(
                                                                    context) *
                                                                0.18,
                                                            height: 200,
                                                            child:
                                                                Image.network(
                                                              collections[index]
                                                                  .image,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ))),
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                    .animate()
                                    .flipH(duration: 80.milliseconds),
                              ),
                            );
                          }));
                  })
          ],
        ),
      ),
    );
  }
}
