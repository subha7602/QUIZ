import 'package:quizz_app/model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "Number of English Alphabets?",
    {
      "21": false,
      "32": false,
      "26": true,
      "50": false,
    },
  ),
  QuestionModel("Color of Apple", {
    "Black": false,
    "White": false,
    "Blue": false,
    "Red": true,
  }),
  QuestionModel("Number of Days in a Year ?", {
    "192": false,
    "365": true,
    "500": false,
    "400": false,
  }),
  QuestionModel("How many moons does Mars have ?", {
    "1": false,
    "2": false,
    "4": true,
    "8": false,
  }),
  QuestionModel("Who is Scahin Tendulkar?", {
    "Dancer": false,
    "Actor": false,
    "Cricketer": true,
    "Artist": false,
  }),
  QuestionModel("About How long would it take to travel to Mars ?", {
    "Three days": false,
    "A month": false,
    "Eight months": true,
    "Two years": false,
  }),
  QuestionModel(
      "Mars is Named after the Roman god Mars. What is he the god of ?", {
    "Fire": false,
    "Love": false,
    "Agriculture": false,
    "War": true,
  }),
  QuestionModel("Mars Is the ___ planet from the sun ?", {
    "Second": false,
    "Third": false,
    "Fourth": true,
    "Sixth": false,
  }),
  QuestionModel(
      "Capital of Japan?",
      {
        "France": false,
        "Massachusetts": false,
        "Carolina": false,
        "Tokyo": true,
      }),
  QuestionModel(
      "Indian Prime Minister?", {
    "Gandhiji": false,
    "Narendra Modi": true,
    "Jayalalitha": false,
    "Karunanithi": false,
  }),
];
