class Constant {
  //Text
  static const titleApp = 'E-commerce-comic';
  static const titleSplash = 'Komiku';

  //Image
  static const logo = 'assets/logo.png';
  static const backgroundImage = 'assets/images/background.png';
  static const books = 'assets/images/books.jpg';

  static const List imagesCarosel = [
    "https://www.komar.de/media/catalog/category/komar_fototapeten_header_Comic.jpg",
    "https://www.epicstuff.com/cdn/shop/collections/DC_1920x450_1a028f78-cf96-4895-9dd3-734518773bab_1920x450.jpg?v=1581967656",
    "https://previews.123rf.com/images/christitze/christitze1611/christitze161124703/66741401-manga-red-text-on-typography-background-3d-rendered-royalty-free-stock-image-this-image-can-be.jpg",
  ];

  static const List<Map<String,String>> filter=[
       {'name':'All Comic','value':''},
        {'name':'Action','value':'action'},
        {'name':'Adventure','value':'adventure'},
        {'name':'Comedy','value':'comedy'},
        {'name':'Drama','value':'drama'},
        {'name':'Fantasy','value':'fantasy'},
        {'name':'Horror','value':'horror'},
        {'name':'Romance','value':'romance'},
        {'name':'Sci-fi','value':'sci-fi'},
        {'name':'Slice of life','value':'slice of life'},
        {'name':'Supernatural','value':'supernatural'},
        {'name':'Thriller','value':'thriller'},
  ];

  static const baseUrl = 'http://comic.budiajidesign.com';
}
