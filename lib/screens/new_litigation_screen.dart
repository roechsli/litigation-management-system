import 'package:flutter/material.dart';
import 'package:litigation_management_system/repositories/claims_repository.dart';
import 'package:survey_kit/survey_kit.dart' as survey;
import 'package:survey_kit/survey_kit.dart';

class NewLitigationScreen extends StatefulWidget {
  const NewLitigationScreen({super.key});

  @override
  State<NewLitigationScreen> createState() => _NewLitigationScreenState();
}

class _NewLitigationScreenState extends State<NewLitigationScreen> {
  SurveyKit? _currentSurvey;
  SurveyController? _currentSurveyController;
  bool isUploadingSurveyResult = false;

  @override
  void initState() {
    super.initState();
    ClaimsRepository.claims.add(swissClaim);
    print(ClaimsRepository.claims);

  }

  Future<void> handleSurveyResult(SurveyResult result) async {
    print(result.finishReason);
    // Define the IDs of the steps to exclude
    Navigator.pop(context);
  }

  SurveyKit litigationSurvery() {
    var survey = SurveyKit(
      onResult: handleSurveyResult,
      surveyController: _currentSurveyController,
      task: getSampleTask2(),
      showProgress: true,
      localizations: {
        'cancel': ' ', //TEMP: Removing the "Cancel Button"
      },
      //themeData: surveryTheme(context),
      surveyProgressbarConfiguration: SurveyProgressConfiguration(
        backgroundColor: Colors.white,
        progressbarColor: Colors.white,
        valueProgressbarColor: Colors.green
      ),
    );
    //_currentSurvey = survey;
    return survey;
  }

  TextChoice textChoiceFromString(String string) {
    return TextChoice(text: string, value: string);
  }

  Task getSampleTask2() {
    var task = NavigableTask(
      id: TaskIdentifier(id: "123"),
      steps: [
        InstructionStep(
          stepIdentifier: StepIdentifier(id: "1"),
          title: "Welcome to the\nLitigation Management System\n",
          text: "Follow the instructions to add a claim!",
          buttonText: "Let's go!",
        ),
        QuestionStep(
          stepIdentifier: StepIdentifier(id: "2"),
          title: "Litigation type",
          text: "Is the litigation active or passive?",
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: "Active",
            negativeAnswer: "Passive",
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          stepIdentifier: StepIdentifier(id: "3"),
          title: "Location?",
          text: "In which jurisdiction is the claim originated?",
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: "Switzerland", value: "ch"),
              TextChoice(text: "Austria", value: "at"),
              TextChoice(text: "France", value: "fr"),
              TextChoice(text: "Sweden", value: "se"),
              TextChoice(text: "Norway", value: "no"),
              TextChoice(text: "Italy", value: "it"),
            ],
          ),
        ),
        QuestionStep(
          stepIdentifier: StepIdentifier(id: "4"),
          title: "Value in dispute?",
          text: "What is the nominal value of the claim?",
          answerFormat: IntegerAnswerFormat(
            defaultValue: 100,
            hint: "Value in millions",
          ),
        ),
        QuestionStep(
          stepIdentifier: StepIdentifier(id: "5"),
          title: "Opposing party?",
          text: "Who is the claimant from/against?",
          answerFormat: TextAnswerFormat(
            maxLines: 5,
            validationRegEx: "^(?!\s*\$).+",
          ),
        ),
        CompletionStep(
          stepIdentifier: StepIdentifier(id: "10"),
          title: "Done!",
          text: "Your claim is saved as a draft. Add more details later!",
          buttonText: "Complete",
        ),
      ],
    );

    // task.setNavigationRuleForTriggerStepIdentifier(
    //   stepIdentifier: StepIdentifier(id: "2"),
    //   destinationStepIdentifier: StepIdentifier(id: "10"),
    //   resultToStepIdentifierMapper: (result) {
    //     if (result == "Active") {
    //       return StepIdentifier(id: "10");
    //     } else {
    //       return null;
    //     }
    //   },
    // );

    // task.setNavigationRuleForTriggerStepIdentifier(
    //   stepIdentifier: StepIdentifier(id: "2"),
    //   destinationStepIdentifier: StepIdentifier(id: "3"),
    //   resultToStepIdentifierMapper: (result) {
    //     if (result == "Passive") {
    //       return StepIdentifier(id: "3");
    //     } else {
    //       return null;
    //     }
    //   },
    // );

    // task.setNavigationRuleForTriggerStepIdentifier(
    //   stepIdentifier: StepIdentifier(id: "3"),
    //   destinationStepIdentifier: StepIdentifier(id: "10"),
    //   resultToStepIdentifierMapper: (result) {
    //     // Define your logic here based on the result.
    //     // Example: You can return different step identifiers based on the result.
    //     return null; // Replace with your logic.
    //   },
    // );

    return task;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // Your widget content goes here
          body: Stack(children: [
        Container(
            color: Colors.white,
            child:
                Align(alignment: Alignment.center, child: litigationSurvery()))
      ])),
    );
  }
}
