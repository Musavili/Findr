class House{
  String name;
  String address;
  String imageUrl;

  House(this.name, this.address, this.imageUrl);

  static List<House> generateRecommend(){
    return [
      House('Fadhili apartments', 'juja, Kiambu', 'assets/images/house01.jpeg'),
      House('Danema apartments', 'juja,   Kiambu', 'assets/images/house02.jpeg'),
      House('Brookside apartments', 'juja, Kiambu', 'assets/images/offer01.jpeg'),
      House('Goshen apartments', 'juja,   Kiambu', 'assets/images/offer02.jpeg'),
    ];
  }

  static List<House> generateBestOffer(){
    return [
      House('Brookside apartments', 'juja, Kiambu', 'assets/images/offer01.jpeg'),
      House('Goshen apartments', 'juja,   Kiambu', 'assets/images/offer02.jpeg'),
      House('Fadhili apartments', 'juja, Kiambu', 'assets/images/house01.jpeg'),
      House('Danema apartments', 'juja,   Kiambu', 'assets/images/house02.jpeg'),
    ];
  }
}