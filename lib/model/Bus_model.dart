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
      img: "assets/photos/bus_img6.png"
  ),
  VetCompany(
      name: "Bus",
      img: "assets/photos/bus_img5.png"
  ),
  VetCompany(
      name: "Bus",
      img: "assets/photos/bus_img7.png"
  ),
  VetCompany(
      name: "Bus",
      img: "assets/photos/bus_img8.jpg"
  ),
  VetCompany(
      name: "Bus",
      img: "assets/photos/bus_img9.jpg"
  ),
  VetCompany(
      name: "Bus",
      img: "assets/photos/bus_img10.jpg"
  ),
];

List<larryta> labus =[
  larryta(
      name: "larryTa",
      img: "assets/photos/bus_img1.png",
  ),
  larryta(
    name: "larryTa",
    img: "assets/photos/bus_img2.png",
  ),
  larryta(
    name: "larryTa",
    img: "assets/photos/bus_img3.png",
  ),
  larryta(
    name: "larryTa",
    img: "assets/photos/bus_img4.png",
  ),
  larryta(
    name: "larryTa",
    img: "assets/photos/bus_img12.jpg",
  ),
];

List<BusList> blist = [
  BusList(
      img: "assets/photos/bus_img7.png",
      name: "Vireak Buntham Bus",
      price: 28,
      rating: 8.5,
      review: "4800 reviews",
      location: "PhnomPenh",
      benefits: ["Free Snacks & Water"]
  ),
  BusList(
      img: "assets/photos/bus_img13.jpg",
      name: "Larry Ta Bus",
      price: 26.5,
      rating: 7.5,
      review: "4400 reviews",
      location: "PhnomPenh",
      benefits: ["Free Snacks & Water"]
  )
];