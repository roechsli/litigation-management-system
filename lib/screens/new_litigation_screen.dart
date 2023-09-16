import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart' as survey;
import 'package:survey_kit/survey_kit.dart';

class NewLitigationScreen extends StatefulWidget {
  const NewLitigationScreen({super.key});

  @override
  State<NewLitigationScreen> createState() => _NewLitigationScreenState();
}

TextChoice textChoiceFromString(String string) {
  return TextChoice(text: string, value: string);
}

class _NewLitigationScreenState extends State<NewLitigationScreen> {
  List<survey.Step> claimQuestions() {
    List<survey.Step> steps = [
      QuestionStep(
        stepIdentifier: StepIdentifier(id: 'childrenQuestion'),
        title: "Question 1",
        text: '',
        isOptional: false,
        buttonText: "Next",
        answerFormat: SingleChoiceAnswerFormat(
          textChoices: [
            textChoiceFromString("Yes"),
            textChoiceFromString("No"),
          ],
        ),
      ),
      QuestionStep(
        stepIdentifier: StepIdentifier(id: 'childrenQuestion'),
        title: "Question 2",
        text: '',
        isOptional: false,
        buttonText: "Next",
        answerFormat: SingleChoiceAnswerFormat(
          textChoices: [
            textChoiceFromString("Yes"),
            textChoiceFromString("No"),
          ],
        ),
      ),
    ];

    return steps;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // Your widget content goes here
      body: Stack(children: [
        Container(
            color: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child:SurveyKit(
      onResult: (SurveyResult result) {
        //Evaluate results
      },
      task: OrderedTask(
          id: TaskIdentifier(id: "id"), steps: [...claimQuestions()]),
      //theme: CustomThemeData(),
    );
  }
}
