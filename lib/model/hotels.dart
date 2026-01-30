class Hotel {
  final String image;
  final String name;
  final double rating;
  final String reviews;
  final String location;
  final int price;
  final int discount;
  final List<String> benefits;

  Hotel({
    required this.image,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.location,
    required this.price,
    required this.discount,
    required this.benefits,
  });
}

List<Hotel> hotels = [
  Hotel(
    image:
        'https://i.pinimg.com/1200x/95/d0/5a/95d05aeb85414ebffc751a687771d304.jpg',
    name: 'Ohana Phnom Penh Palace Hotel',
    rating: 8.4,
    reviews: '2864 reviews',
    location: 'Phnom Penh',
    price: 42,
    discount: 52,
    benefits: ['Free cancellation', 'No prepayment'],
  ),

  Hotel(
    image:
        'https://i.pinimg.com/1200x/51/e3/68/51e368f640d241896dea8801411f59a6.jpg',
    name: 'Aquarius Hotel and Urban Resort',
    rating: 9.2,
    reviews: '2,325 reviews',
    location: 'Phnom Penh',
    price: 68,
    discount: 75,
    benefits: ['Free cancellation'],
  ),

  Hotel(
    image:
        'https://i.pinimg.com/1200x/7e/ad/a5/7eada5edde204ced50269047b66b4b31.jpg',
    name: 'Plantation Urban Resort & Spa',
    rating: 9.0,
    reviews: '3,104 reviews',
    location: 'Phnom Penh',
    price: 80,
    discount: 65,
    benefits: ['Free WiFi', 'Spa access'],
  ),

  Hotel(
    image:
        'https://i.pinimg.com/736x/0b/11/03/0b1103ac076747377556081e053fdac2.jpg',
    name: 'Luxcity Hotel & Apartment',
    rating: 8.8,
    reviews: '1,450 reviews',
    location: 'Phnom Penh',
    price: 55,
    discount: 60,
    benefits: ['Free parking', 'City view'],
  ),

  Hotel(
    image:
        'https://i.pinimg.com/736x/e8/84/d8/e884d81b1e14f48e732dfd92138b7f42.jpg',
    name: 'Baitong Hotel & Resort',
    rating: 8.9,
    reviews: '2,210 reviews',
    location: 'Phnom Penh',
    price: 72,
    discount: 70,
    benefits: ['Swimming pool', 'Free cancellation'],
  ),

  Hotel(
    image:
        'https://i.pinimg.com/1200x/16/bc/df/16bcdf1f9a9a72d10411ba4f34f05f66.jpg',
    name: 'Raffles Hotel Le Royal',
    rating: 9.4,
    reviews: '980 reviews',
    location: 'Phnom Penh',
    price: 180,
    discount: 40,
    benefits: ['Luxury stay', 'Breakfast included'],
  ),

  Hotel(
    image:
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/a5/36/6e/cloud-9-sky-bar.jpg?w=2000&h=-1&s=1',
    name: 'Sun & Moon Urban Hotel',
    rating: 8.6,
    reviews: '1,870 reviews',
    location: 'Phnom Penh',
    price: 50,
    discount: 55,
    benefits: ['Free WiFi', 'Rooftop pool'],
  ),

  Hotel(
    image:
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/223865858.jpg?k=53948a7ac1955871e2c48b2a3cd6b32b503dc42f3ec2135af2347740e01ea7a3&o=',
    name: 'HM Grand Central Hotel',
    rating: 8.3,
    reviews: '1,120 reviews',
    location: 'Phnom Penh',
    price: 45,
    discount: 58,
    benefits: ['Free breakfast'],
  ),

  Hotel(
    image:
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/140105465.jpg?k=dcffa0d8d9572cc37edfd73a0425da1de10ca7a55eeafd1fc6cd68c509bd0bc1&o=',
    name: 'The Bridge Club',
    rating: 7.7,
    reviews: '467 reviews',
    location: 'Phnom Penh',
    price: 60,
    discount: 62,
    benefits: ['River view', 'Gym access'],
  ),

  Hotel(
    image:
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/160844224.jpg?k=ab7ecc9291e1cc9d69f7da34ffbf0278560065164982d4a95e55123848e10a16&o=',
    name: 'iRoHa Garden Hotel & Resort',
    rating: 9.1,
    reviews: '860 reviews',
    location: 'Phnom Penh',
    price: 70,
    discount: 68,
    benefits: ['Quiet area', 'Free cancellation'],
  ),
];
