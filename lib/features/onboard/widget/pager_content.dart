import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zerin_express/helper/svg_image_helper.dart';
import 'package:zerin_express/util/dimensions.dart';
import 'package:zerin_express/util/styles.dart';


class PagerContent extends StatelessWidget {
  const PagerContent({super.key, required this.image, required this.text1, required this.text2, required this.text3, required this.text4, required this.index});
  final String image;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final int index;

  @override
  Widget build(BuildContext context) {
    if(index != 3) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(text: text1, style: textBold.copyWith(fontSize: 32, color: Colors.white)),
                        TextSpan(text: text2, style: textBold.copyWith(fontSize: 32, color: Colors.white.withValues(alpha:0.8))),
                        TextSpan(text: text3, style: textBold.copyWith(fontSize: 32, color: Colors.white)),
                        TextSpan(text: text4, style: textBold.copyWith(fontSize: 32, color: Colors.white.withValues(alpha:0.8))),
                      ]
                    )
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),
                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              )
            ),
          ),

          const Spacer(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha:0.1),
                  blurRadius: 20,
                  spreadRadius: 5,
                )
              ]
            ),
            child: FutureBuilder<String>(
                future: loadSvgAndChangeColors(image, Colors.white),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    return SvgPicture.string(
                      snapshot.data!, width: Get.width * 0.8,
                    );
                  }
                  return SvgPicture.asset(image, width: Get.width * 0.8);
                }
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.1)
        ],
      );
    }

     return Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         const Spacer(),
         
         Container(
           padding: const EdgeInsets.all(20),
           decoration: BoxDecoration(
             color: Colors.white.withValues(alpha:0.1),
             shape: BoxShape.circle,
           ),
           child: FutureBuilder<String>(
               future: loadSvgAndChangeColors(image, Colors.white),
               builder: (context, snapshot){
                 if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                   return SvgPicture.string(
                       snapshot.data!,
                       width: 200,
                   );
                 }
                 return const SizedBox(height: 150, child: Center(child: CircularProgressIndicator(color: Colors.white)));
               }
           ),
         ),
         const SizedBox(height: Dimensions.paddingSizeOverLarge),

         Padding(
           padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge),
           child: RichText(
             textAlign: TextAlign.center,
             text: TextSpan(
               children: [
                 TextSpan(text: text1, style: textBold.copyWith(fontSize: 32, color: Colors.white)),
                 TextSpan(text: text2, style: textBold.copyWith(fontSize: 32, color: Colors.white.withValues(alpha:0.8))),
                 TextSpan(text: text3, style: textBold.copyWith(fontSize: 32, color: Colors.white)),
                 TextSpan(text: text4, style: textBold.copyWith(fontSize: 32, color: Colors.white.withValues(alpha:0.8))),
               ]
           )),
         ),
         const Spacer(),

       ],
     );
   }
}