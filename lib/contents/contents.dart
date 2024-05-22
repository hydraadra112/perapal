class Contents {
  String image;
  String title;
  String text;

  Contents({required this.image, required this.title, required this.text});

}

List<Contents> contents = [

  Contents(
    image: 'assets/logo.png',
    title: "Welcome to PeraPal!",
    text: 'Discover a beginner-friendly platform designed to help you take control of your finances.'
    'Start your journey to financial wellness today!'
  ),
  Contents(
    image: 'assets/logo.png',
    title: "Expense Tracking",
    text: 'Easily track daily expenses across categories like groceries, utilities, and entertainment.'
    ' Keep your records accurate and up-to-date.'
  ),
  Contents(
    image: 'assets/logo.png',
    title: "Budget Management",
    text: 'Create and adjust customized budgets for different spending categories or an overall '
    'monthly budget to manage your finances effectively.'
  ),
    Contents(
    image: 'assets/logo.png',
    title: "Goal Setting and Tracking",
    text: 'Set and track financial goals such as saving for a vacation or paying off debt. '
    'Get monthly reports to see how your spending aligns with your objectives.'
  ),
    Contents(
    image: 'assets/logo.png',
    title: "Cross-Platform Accessibility",
    text: 'Access your financial information anytime, anywhere on smartphones, tablets, and desktops.'
    ' Enjoy cloud-based storage for automatic data backup and sync.'
  ),
];