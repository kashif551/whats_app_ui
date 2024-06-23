import 'package:http/http.dart' as http;
class ApiCall {
  String apiProductsUrl = "https://jsonplaceholder.typicode.com/posts";
  //// function to call api get products
 Future getProducts()async{
    var products = await  http.get(Uri.http(apiProductsUrl));
    print(products);
    return products;
  }
}