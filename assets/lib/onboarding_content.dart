class OnBoardingContent {
  String title;
  String image;
  String description;

  OnBoardingContent(
      {required this.title, required this.description, required this.image});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: 'Talk',
      description:
      'description description description description talk to more and improve ',
      image: 'assets/images/chat.png'),
  OnBoardingContent(
      title: 'Talk more',
      description: 'description description talk to more and improve ',
      image: 'assets/images/lady.png'),
  OnBoardingContent(
      title: 'Talk aloud',
      description:
      ' Talk aloud description description talk to more and improve ',
      image: 'assets/images/girl.png'),
];
