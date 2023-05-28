import 'package:flutter/material.dart';
import 'package:focodemobile/screens/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../bmi_brain.dart';
import '../components/icon_content.dart';
import '../components/resuable_widget.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';

enum Gender { male, female }

class inputPage extends StatefulWidget {
  const inputPage({Key? key})
      : super(key: key);

  @override
  State<inputPage> createState() =>
      _inputPageState();
}

class _inputPageState
    extends State<inputPage> {
  Gender? selectedGender;
  int height = 175;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
                'BMI CALCULATOR')),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child:
                    ReusableWidget(
                      onPressed: () {
                        setState(() {
                          selectedGender =
                              Gender
                                  .male;
                        });
                      },
                      color: (selectedGender ==
                          Gender
                              .male)
                          ? KActiveCardColor
                          : KInactiveCardColor,
                      child:
                      IconContent(
                        iconData:
                        FontAwesomeIcons
                            .mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                    ReusableWidget(
                      onPressed: () {
                        setState(() {
                          selectedGender =
                              Gender
                                  .female;
                        });
                      },
                      color: (selectedGender ==
                          Gender
                              .female)
                          ? KActiveCardColor
                          : KInactiveCardColor,
                      child: IconContent(
                          iconData:
                          FontAwesomeIcons
                              .venus,
                          label:
                          "FEMALE"),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableWidget(
                color: KActiveCardColor,
                child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                    children: [
                      const Text(
                        "HEIGHT",
                        style:
                        KLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .baseline,
                        textBaseline:
                        TextBaseline
                            .alphabetic,
                        children: [
                          Text(
                            height
                                .toString(),
                            style:
                            KNumberStyle,
                          ),
                          const Text(
                            "cm",
                            style:
                            KLabelStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: const SliderThemeData(
                            trackHeight:
                            1,
                            thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius:
                                20),
                            overlayShape:
                            RoundSliderOverlayShape(
                                overlayRadius:
                                30),
                            activeTrackColor:
                            Colors
                                .white,
                            inactiveTrackColor:
                            Color(
                                0xFF888993),
                            thumbColor:
                            Color(
                                0xFFEB1555),
                            overlayColor:
                            Color(
                                0x20EB1555)),
                        child: Slider(
                          value: height
                              .toDouble(),
                          onChanged:
                              (double
                          value) {
                            setState(
                                    () {
                                  height =
                                      value
                                          .round();
                                });
                          },
                          min: 120,
                          max: 220,
                        ),
                      )
                    ]),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child:
                    ReusableWidget(
                      color:
                      KActiveCardColor,
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                        children: [
                          const Text(
                            "Weight",
                            style:
                            KLabelStyle,
                          ),
                          Text(
                            weight
                                .toString(),
                            style:
                            KNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                            children: [
                              RoundIconButton(
                                iconData:
                                Icons
                                    .remove,
                                onPressed:
                                    () {
                                  setState(
                                          () {
                                        weight--;
                                      });
                                },
                              ),
                              const SizedBox(
                                width:
                                10,
                              ),
                              RoundIconButton(
                                  iconData: Icons
                                      .add,
                                  onPressed:
                                      () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                    ReusableWidget(
                        color:
                        KActiveCardColor,
                        child:
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: [
                            const Text(
                              "AGE",
                              style:
                              KLabelStyle,
                            ),
                            Text(
                              age
                                  .toString(),
                              style:
                              KNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                              children: [
                                RoundIconButton(
                                  iconData: Icons
                                      .remove,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                    iconData: Icons
                                        .add,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    }),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            BottomButton(
                onPressed: () {
                  BMIBrain bmiBrain = BMIBrain(height: height,weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder:
                              (
                              context) {

                            return ResultPage(

                              result: bmiBrain.getResult(),
                              bmi: bmiBrain.getBMI(),
                              interpretation:
                              bmiBrain.getInterpretation(),
                            );
                          }));
                },
                label:
                "CALCULATE YOUR BMI"),
          ],
        ));
  }
}
