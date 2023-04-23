import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileDrawer extends ConsumerWidget {
  const MobileDrawer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Drawer(
      width: displayWidth(context),
      child: Stack(
        children: 
          [ 

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: ()=>Navigator.pop(context), icon:
               const Icon(Icons.close,color: Colors.black,size: 38,)
                ),
            ),
            Column(
            children: [
              
            ],
          ),
        ],
      )
    );
  }
}