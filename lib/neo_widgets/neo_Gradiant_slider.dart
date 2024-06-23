import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_ui_design/constants.dart';

import '../custom_painter/gradiant_line.dart';



class NeoGradiantSlider extends StatelessWidget {
  final double h;
  final double w;
  final int percent;
  final List<Color> color;
  final String field;

   const NeoGradiantSlider({super.key,
     required this.h,
     required this.w,
     required this.percent,
     required this.color,
     required this.field
   });

  @override
  Widget build(BuildContext context) {
    double calculatedHeight = (percent / 100) * 150;

    return Column(
      children: [
        percent == 0 ?
        Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
              color: neuLightBgColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, -5),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: neuDarkColor,
                  offset: Offset(5, 5),
                  blurRadius: 10,
                )
              ]
          ),
        ) :
            Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: neuDarkColor,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: -5,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: (w - 31) / 2,
                    bottom: 4,
                    child: CustomPaint(
                      size: Size(30, calculatedHeight),
                      painter: LinePainter(lineWidth: 30, cornerRadius: 15, color: color),
                    ),
                  ),
                ],
              ),
            ),
        const SizedBox(height: 5,),
        Opacity(
          opacity: 0.4,
          child: Text(field, style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,),),
        ),
        const SizedBox(height: 3,),
        Opacity(
          opacity: 0.5,
          child: Text('$percent%', style: GoogleFonts.roboto(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.black,),),
        ),
      ],
    );
  }
}

