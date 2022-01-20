class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Welcome to UDRA APP',
    image: 'assets/onboarding/office_team.jpg',
  ),
  OnBoarding(
    title: 'Develop yourself easily',
    image: 'assets/onboarding/study.jpg',
  ),
  OnBoarding(
    title: 'Keep track of your learning',
    image: 'assets/onboarding/team_dev.jpg',
  ),
  OnBoarding(
    title: 'Join a supportive community',
    image: 'assets/onboarding/smart_learning.jpg',
  ),
];
