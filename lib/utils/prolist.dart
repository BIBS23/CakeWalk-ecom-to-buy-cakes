class ProList {
  final String proname;
  final String proimg;
  final String price;
  final String details;

  ProList({
    required this.proname,
    required this.proimg,
    required this.price,
    required this.details,
  });

  static List prodetails = [
  ProList(
    proname: "Plum Cake",
    proimg: "assets/plum.png",
    price: "210",
    details: "Chirstmas special plum cake from SMYM Poonjar "
  ),
  ProList(proname: "Marble Cake", 
    proimg: "assets/marble.jpg",
    price: "220",
    details:" Chirstmas special Plum Cake from SMYM Poonjar "
  ),
    ProList(proname: "PineApple Cake", 
    proimg: "assets/pineapple.jpg",
    price: "280",
    details:"Chirstmas special PineApple Cake from SMYM Poonjar "
  ),
    ProList(proname: "Beetroot Cake", 
    proimg: "assets/beetroot.jpg",
    price: "280",
    details:"Chirstmas special Beetroot cake from SMYM Poonjar"
  ),
  ProList(proname: "Carrot Cake", 
    proimg: "assets/carrot.jpg",
    price: "280",
    details:"Chirstmas special Carrot cake from SMYM Poonjar "
  ),
   ProList(proname: "Banana Cake", 
    proimg: "assets/banana.jpg",
    price: "280",
    details:"Chirstmas special Banana cake from SMYM Poonjar "
  ),

];
}


