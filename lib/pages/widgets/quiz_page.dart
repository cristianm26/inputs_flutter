import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> _questions = [
    Question(
      label: "¿Que plataforma vez en tu tiempo libre",
      options: ["Twitch", "YouTube", "FacebookWatch"],
    ),
    Question(
      label: "¿Que marca de zapatos te gusta mas",
      options: ["Nike", "Jordan", "Adidas"],
    ),
  ];

  void _optionChanged(int questionIndex, int optionIndex) {
    final Question question = _questions[questionIndex];
    final String option = question.options[optionIndex];
    final bool isOptionSelected = question.answers.contains(option);

    final answers = List<String>.from(question.answers);

    if (isOptionSelected) {
      answers.remove(option);
    } else {
      answers.add(option);
    }

    _questions[questionIndex] = question.copyWith(answers);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: List.generate(
            _questions.length,
            (questionIndex) {
              final Question question = _questions[questionIndex];
              return QuestionView(
                question: question,
                onItemChanged: (optionIndex) {
                  _optionChanged(questionIndex, optionIndex);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class QuestionView extends StatelessWidget {
  final void Function(int optionIndex) onItemChanged;
  const QuestionView({
    Key? key,
    required this.question,
    required this.onItemChanged,
  }) : super(key: key);

  final Question question;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.label),
          Wrap(
            children: List.generate(question.options.length, (optionIndex) {
              final option = question.options[optionIndex];
              final bool isSelected = question.answers.contains(option);
              return CheckboxListTile(
                  value: isSelected,
                  title: Text(option),
                  contentPadding: const EdgeInsets.only(left: 0),
                  onChanged: (value) {
                    onItemChanged(optionIndex);
                  });
              /*   return Row(
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      onItemChanged(optionIndex);
                    },
                  ),
                  GestureDetector(
                    child: Text(option),
                    onTap: () {
                      onItemChanged(optionIndex);
                    },
                  ),
                ],
              );
             */
            }),
          )
        ],
      ),
    );
  }
}

class Question {
  final String label;
  final List<String> options;
  final List<String> answers;

  Question({
    required this.label,
    required this.options,
    this.answers = const [],
  });

  Question copyWith(
    List<String> answers,
  ) {
    return Question(
      label: label,
      options: options,
      answers: answers,
    );
  }
}
