class OnboardModel {
  String header;
  String imagepath;
  String body;

  OnboardModel({ required this.header, required this.imagepath, required this.body});
}
 List<OnboardModel> screens = [
    OnboardModel(
      header: "Proven \n specialists",
      imagepath: "assets/images/illustration.png",
      body: "We check each specialist before \n he starts work"
    ), 
   OnboardModel(
    header: "Honest \n rating",
    imagepath: "assets/images/Page.3.png",
    body: "We carefully check each specialist and put honest rating"
   ),
   OnboardModel(
     header: "Insured \n orders",
     imagepath: "assets/images/Page.3.png",
     body: "We insure each order for the \n amount of \$500"
   ),
   OnboardModel(
    header: "Create \n order",
    imagepath: "assets/images/page4.png",
    body: "It's easy, just click on the plus"
   )
 
  ];
