abstract class ApiConsumer{

Future<dynamic> post(
    String path,
    {
     Object? data,
     Map<String,dynamic>? queryParams,
     bool isFormData= false,
    }
 );

Future<dynamic> get(
    String path,
    {
      Object? data,
      Map<String,dynamic>? queryParams,
    }
    );

Future<dynamic> delete(
    String path,
    {
      Object? data,
      Map<String,dynamic>? queryParams,
    }
    );

Future<dynamic> patch(
    String path,
    {
      Object? data,
      Map<String,dynamic>? queryParams,
    }
    );


}