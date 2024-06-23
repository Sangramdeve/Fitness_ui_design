import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fitness_ui_design/neo_widgets/neo_Gradiant_slider.dart';
import 'package:fitness_ui_design/neo_widgets/neo_button.dart';


import '../constants.dart';
import '../custom_painter/gradiant_ circle.dart';

class Neumorphic extends StatefulWidget {
  const Neumorphic({super.key});

  @override
  State<Neumorphic> createState() => _NeumorphicState();
}

class _NeumorphicState extends State<Neumorphic> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: neuLightBgColor,
      appBar:  AppBar(
        leading: const Icon(Icons.menu),
        title: Center(
          child: Opacity(
            opacity: 0.6,
            child: Text(
              'F I T N E S S',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),
        actions: const [
          Icon(Icons.person, color: Colors.black),
          SizedBox(width: 15,)
        ],
        backgroundColor: neuLightBgColor,
        elevation: 0,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 15,right: 15,bottom: 40,top: 35),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Text('Statistics', style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,),),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if(light) {
                              light= false;
                            }else{
                              light = true;
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 100,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(20) ,
                            boxShadow: const [
                              BoxShadow(
                                color: neuDarkColor,
                              ),
                              BoxShadow(
                                color: neuLightColor,
                                spreadRadius: -5.0,
                                blurRadius: 20.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 200),
                                  right: light ? 0.5 : 52,
                                  child:  Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                        color: light ? Colors.teal : neuLightColor,
                                        borderRadius: BorderRadius.circular(17),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          offset: const Offset(2, 2),
                                          blurRadius: 6,
                                        ),
                                        BoxShadow(
                                          color: neuLightColor.withOpacity(0.7),
                                          offset: const Offset(-2, -2),
                                          blurRadius: 6,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Text('Charts', style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,),),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: neuLightBgColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(-10, -10),
                        blurRadius: 25,
                        spreadRadius: 15,
                        color: neuLightColor,
                      ),
                      BoxShadow(
                        offset: Offset(10, 10),
                        blurRadius: 25,
                        color: neuDarkColor,
                      ),
                    ]
                ),
                child: Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: neuDarkColor,
                        ),
                        BoxShadow(
                          color: neuLightColor,
                          spreadRadius: -10.0,
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: CustomPaint(
                        size: Size(10,50),
                        painter: CirclePainter2(percent: 70, outerRadius: 40, innerRadius: 20, color: [circle,circle2]),
                        child:  Center(
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                                color: neuLightColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(

                                  )
                                ]
                            ),
                            child: Center(
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: neuDarkColor,

                                    ),
                                    BoxShadow(
                                      color: neuLightColor,
                                      spreadRadius: -5.0,
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                      )
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50,right: 15,left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    NeoGradiantSlider(h: 160, w: 40, percent: 47, color: [strength4,strength3,strength2,strength], field: 'Strength',),
                    NeoGradiantSlider(h: 160, w: 40, percent: 0, color: [stretch4,stretch3,stretch2,stretch], field: 'Stretch',),
                    NeoGradiantSlider(h: 160, w: 40, percent: 90,color: [relax,relax2,relax3,relax4], field: 'Relax',),
                    NeoGradiantSlider(h: 160, w: 40, percent: 60, color: [cardio4,cardio3,cardio2,cardio], field: 'Cardio',),
                  ],
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NeoButton(icon: Icon(Icons.home_rounded),),
                    NeoButton(icon: Icon(Icons.monitor_weight_outlined),),
                    NeoButton(icon: Icon(Icons.bar_chart),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
