class Survey {
  int? id;
  String? title;
  bool? isWelcomeScreen;
  String? welcomeMessage;
  String? welcomedescription;
  String? buttontext;
  bool? isDoneScreen;
  String? doneMessage;
  String? donedescription;
  List<QuestionModel>? questions;

  Survey(
      {this.id,
      this.title,
      this.isWelcomeScreen,
      this.welcomeMessage,
      this.welcomedescription,
      this.buttontext,
      this.isDoneScreen,
      this.doneMessage,
      this.donedescription,
      this.questions});

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      id: json['id'],
      title: json['title'],
      isWelcomeScreen: json['isWelcomeScreen'],
      welcomeMessage: json['welcomeMessage'],
      welcomedescription: json['welcomedescription'],
      buttontext: json['buttontext'],
      isDoneScreen: json['isWelcomeScreen'],
      doneMessage: json['doneMessage'],
      donedescription: json['donedescription'],
      questions: json.containsKey('questions')
          ? List<QuestionModel>.from(json['questions'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isWelcomeScreen': isWelcomeScreen,
      'welcomeMessage': welcomeMessage,
      'welcomedescription': welcomedescription,
      'buttontext': buttontext,
      'isDoneScreen': isDoneScreen,
      'doneMessage': doneMessage,
      'donedescription': donedescription,
      'questions': questions,
    };
  }
}

class QuestionModel {
  int id;
  String question;
  String questionType;
  String description;
  List<String> answers;

  QuestionModel({
    required this.id,
    required this.question,
    required this.questionType,
    required this.description,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      question: json['question'],
      questionType: json['questionType'],
      description: json['description'],
      answers: List<String>.from(json['answers']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'questionType': questionType,
      'description': description,
      'answers': answers,
    };
  }
}
