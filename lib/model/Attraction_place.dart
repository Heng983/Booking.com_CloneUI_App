class Place {
  final String name;
  final String image;
  final double rating;
  final String reviews;
  final double price;
  final String location;
  final String description;
  final String duration;
  final List<String> benefits;

  Place({
    required this.name,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.location,
    required this.duration,
    required this.description,
    required this.benefits,
  });
}

List<Place> places = [
  Place(
    name: "The Killing Field and Toul Sleng \nGenocide Museum (S21)",
    image:
        "https://i.pinimg.com/1200x/c2/a3/e2/c2a3e23522c9874cfee162faccbd7a01.jpg",
    rating: 4.8,
    reviews: "505 reviews",
    price: 19.20,
    location: "St.113, Boeung Keng Kang III, \nKhan Boeng Keng Kang, \nPhnom Penh.",
    duration: "4",
    description:
        "The Tuol Sleng Genocide Museum is a museum for the Cambodian genocide. Located in Phnom Penh, the site is a former secondary school used as an internment facility known as Security Prison 21 (S-21) by the Khmer Rouge regime from 1975 until its fall in 1979. From 1976 to 1979, an estimated 20,000 people were imprisoned at Tuol Sleng as one of between 150 and 196 torture and execution centers established by the Khmer Rouge and their secret police.On 26 July 2010, the Extraordinary Chambers in the Courts of Cambodia convicted the prison's chief, Kang Kek Iew, for crimes against humanity and grave breaches of the 1949 Geneva Conventions. He died in 2020 while serving a life sentence.",
    benefits: ['Free cancellation', 'No prepayment'],
  ),

   Place(
    name: "Royal Palace Phnom Penh",
    image:
        "https://i.pinimg.com/1200x/5a/7a/cf/5a7acfb329a0269d48cb529b3020c12e.jpg",
    rating: 4.7,
    reviews: "1,240 reviews",
    price: 10.00,
    location: "Samdach Sothearos Blvd, \nPhnom Penh",
     duration: "4",
    description:
        "The Royal Palace is a complex of buildings which serves as the royal residence of the King of Cambodia. It is one of Phnom Penh’s most visited attractions.",
    benefits: ['Skip the line', 'Guide available'],
  ),

  Place(
    name: "Wat Phnom",
    image:
        "https://i.pinimg.com/1200x/a3/53/5a/a3535a63b7e2efb8aa7a9d2c75039742.jpg",
    rating: 4.6,
    reviews: "980 reviews",
    price: 5.00,
    location: "Wat Phnom, Daun Penh, \nPhnom Penh",
    duration: "4",
    description:
        "Wat Phnom is a Buddhist temple and the tallest religious structure in Phnom Penh, standing at 27 meters high.",
    benefits: ['Cultural site', 'Open daily'],
  ),

  Place(
    name: "National Museum of Cambodia",
    image:
        "https://i.pinimg.com/1200x/60/ae/62/60ae626d318572e57fba0ef97500e2ec.jpg",
    rating: 4.7,
    reviews: "760 reviews",
    price: 10.00,
    location: "Street 13, Sangkat Chey \nChumneas, Phnom Penh",
    duration: "4",
    description:
        "The National Museum houses one of the world’s largest collections of Khmer art, including sculptures from Angkor.",
    benefits: ['Audio guide', 'Photography allowed'],
  ),

  Place(
    name: "Central Market (Phsar Thmei)",
    image:
        "https://i.pinimg.com/1200x/b0/54/07/b05407ae619645b534ad8f117802494f.jpg",
    rating: 4.4,
    reviews: "1,530 reviews",
    price: 0.00,
    location: "Preah Sisowath Blvd, \nPhnom Penh",
    duration: "No limit",
    description:
        "Central Market is an iconic Art Deco market offering local food, souvenirs, clothes, and jewelry.",
    benefits: ['Free entry', 'Local shopping'],
  ),

  Place(
    name: "Choeung Ek Genocidal Center",
    image:
        "https://i.pinimg.com/1200x/8f/49/ed/8f49ed73bacc41f9746178f290914f24.jpg",
    rating: 4.8,
    reviews: "890 reviews",
    price: 6.00,
    location: "Choeung Ek, Dangkor, \nPhnom Penh",
    duration: "4",
    description:
        "Choeung Ek is a former orchard that was used as an execution site during the Khmer Rouge regime.",
    benefits: ['Audio tour included'],
  ),

  Place(
    name: "Independence Monument",
    image:
        "https://i.pinimg.com/1200x/58/53/9f/58539f1318bbcca892589287765f32a0.jpg",
    rating: 4.5,
    reviews: "670 reviews",
    price: 0.00,
    location: "Norodom Blvd, \nPhnom Penh",
    duration: "No limit",
    description:
        "The Independence Monument commemorates Cambodia’s independence from France in 1953.",
    benefits: ['Free entry', 'Best at night'],
  ),

  Place(
    name: "Mekong River Cruise",
    image:
        "https://i.pinimg.com/1200x/65/9d/2b/659d2beb328eb76b8a9a7afc4cb8a2f6.jpg",
    rating: 4.6,
    reviews: "420 reviews",
    price: 15.00,
    location: "Sisowath Quay, \nPhnom Penh",
    duration: "2",
    description:
        "A relaxing cruise along the Mekong River offering scenic views of Phnom Penh, especially at sunset.",
    benefits: ['Sunset view', 'Refreshments included'],
  ),

  Place(
    name: "Russian Market (Toul Tom Poung)",
    image:
        "https://images.realestate.com.kh/files/2023-10/screenshot-2023-10-10-095002.png",
    rating: 4.3,
    reviews: "1,110 reviews",
    price: 0.00,
    location: "Street 444, \nPhnom Penh",
    duration: "No limit",
    description:
        "The Russian Market is famous for souvenirs, handicrafts, clothes, and local street food.",
    benefits: ['Free entry', 'Local experience'],
  ),

  Place(
    name: "Silk Island (Koh Dach)",
    image:
        "https://lirp.cdn-website.com/6877c107/dms3rep/multi/opt/d3-1920w.jpg",
    rating: 4.6,
    reviews: "310 reviews",
    price: 12.00,
    location: "Koh Dach, Mekong River, \nPhnom Penh",
    duration: "6",
    description:
        "Silk Island is known for traditional silk weaving villages and peaceful rural scenery.",
    benefits: ['Boat ride included', 'Cultural tour'],
  ),
];
