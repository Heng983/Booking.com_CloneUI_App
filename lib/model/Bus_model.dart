class VetCompany{
  final String name;
  final String img;

  VetCompany({
    required this.name,
    required this.img,
});
}

class larryta {
  final name;
  final img;

  larryta({
    required this.name,
    required this.img,
});
}

class BusList{
  final String img;
  final String name;
  final double price;
  final double rating;
  final String review;
  final String location;
  final List<String> benefits;

  BusList({
    required this.img,
    required this.name,
    required this.price,
    required this.rating,
    required this.review,
    required this.location,
    required this.benefits,
});
}

List<VetCompany> vet = [
  VetCompany(
      name: "Bus",
      img: "https://cdn.discordapp.com/attachments/690815477664186378/1465999494926565447/619062017_1259126706090455_8850549526621682134_n.png?ex=697c776c&is=697b25ec&hm=aaa3f039b054b759dfb9c764d088f39d9e7c539dbdd6f0a7e43b2fa5365859d0&"
  ),
  VetCompany(
      name: "Bus",
      img: "https://i.pinimg.com/736x/36/9a/96/369a9601115eff7bda16c650fe48375d.jpg"
  ),
  VetCompany(
      name: "Bus",
      img: "https://i.pinimg.com/736x/d2/87/6d/d2876dd77f403ad7499e7eed39491825.jpg"
  ),
  VetCompany(
      name: "Bus",
      img: "https://i.pinimg.com/736x/2b/3b/2f/2b3b2f619f4b8ede4ed8800c3441fccb.jpg"
  ),
  VetCompany(
      name: "Bus",
      img: "https://i.pinimg.com/736x/e8/d0/e1/e8d0e1b2b273b92a08a80df83a6695e3.jpg"
  ),
  VetCompany(
      name: "Bus",
      img: "https://cdn.discordapp.com/attachments/690815477664186378/1465999020337004617/619516986_1262956159040843_5013548952959167505_n.png?ex=697c76fb&is=697b257b&hm=4dd82114a9f6d7f62ad8fa76fe35d961c6d4e8359be64c3b3ecd6a20cb1241bb&"
  ),
];

List<larryta> labus =[
  larryta(
      name: "larryTa",
      img: "https://i.pinimg.com/1200x/4f/dd/39/4fdd399d7f2f7a536c2ae708f923ea14.jpg",
  ),
  larryta(
    name: "larryTa",
    img: "https://cdn.discordapp.com/attachments/690815477664186378/1465997029527392372/622859189_122151056036930524_919352917410604405_n.png?ex=697c7520&is=697b23a0&hm=0051f19a0cc413ce6bc3e1e93fcd1249d1920929220aa5a98520cc8e8960980d&",
  ),
  larryta(
    name: "larryTa",
    img: "https://cdn.discordapp.com/attachments/690815477664186378/1465997298088546487/616810473_122149419752930524_5841496030971949723_n.png?ex=697c7560&is=697b23e0&hm=1d3b73031de10e7f12090ae2ecda35561ac58b713ae14497bc47c03ca5e483f2&",
  ),
  larryta(
    name: "larryTa",
    img: "https://cdn.discordapp.com/attachments/690815477664186378/1465997684195332261/611614143_122147618594930524_8446524781709105535_n.png?ex=697c75bc&is=697b243c&hm=99ae5750b6e35526575a6334dfae6d6dd6624d31e7987f80043a61b7ab8f966f&",
  ),
  larryta(
    name: "larryTa",
    img: "https://cdn.discordapp.com/attachments/690815477664186378/1465998346899554406/605661847_122145760250930524_4750260564518726350_n.png?ex=697c765a&is=697b24da&hm=ee9b02aa6c9f6c8f5f70fa91d8a5b8b2d9d7ee87b5fbda8c42637f9fc53ff752&",
  ),
];

List<BusList> blist = [
  BusList(
      img: "https://cdn.discordapp.com/attachments/690815477664186378/1466133813934428222/619182160_1263793075623818_2773068419665186193_n.png?ex=697d9d44&is=697c4bc4&hm=848cf63144f738c58c17b5d3b2629e87e630f0a6246319cc3aede5513a993a29&",
      name: "Vireak Buntham Bus",
      price: 28,
      rating: 8.5,
      review: "4800 reviews",
      location: "PhnomPenh",
      benefits: ["Free Snacks & Water"]
  ),
  BusList(
      img: "https://cdn.discordapp.com/attachments/690815477664186378/1465997684195332261/611614143_122147618594930524_8446524781709105535_n.png?ex=697c75bc&is=697b243c&hm=99ae5750b6e35526575a6334dfae6d6dd6624d31e7987f80043a61b7ab8f966f&",
      name: "Larry Ta Bus",
      price: 26.5,
      rating: 7.5,
      review: "4400 reviews",
      location: "PhnomPenh",
      benefits: ["Free Snacks & Water"]
  )
];