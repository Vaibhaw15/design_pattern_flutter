
import 'dart:convert';

class PostAPI1 {
  String getYouTubePosts() {
    return '''
    [
      {
        "title": "Automatic Code Generation with Flutter",
        "description": "Generate automatically"
      },
      {
        "title": "Twitter Clone with Flutter",
        "description": "Clones"
      }
    ]
    ''';
  }
}

class PostAPI2 {
  String getMediumPosts() {
    return '''
    [
      {
        "header": "Aasasas",
        "bio": "Gwqweqwe"
      },
      {
        "header": "Twitter Clone with Flutter",
        "bio": "Clones"
      }
    ]
    ''';
  }
}

abstract class IPostAPT{
  List<Post> getPosts();
}

class Post{
  final String title;
  final  String bio;
  Post({
    required this.title,
    required this.bio});
}

//Adapter

class PostApi1Adapter implements IPostAPT{

  final api = PostAPI1();
  
  @override
  List<Post> getPosts() {
      final data = jsonDecode(api.getYouTubePosts()) as List;
      return data
      .map(
        (e) => Post(
          title:e['title'],
          bio:e['description'])
          ).toList();
  }
 
  
}

class PostApi2Adapter implements IPostAPT{

  final api = PostAPI2();
  @override
  List<Post> getPosts() {
     final data = jsonDecode(api.getMediumPosts()) as List;
     return data
     .map((e) => Post(
      title:e['header'],
      bio:e['bio'])).toList();
  }
  
}

class PostAPI implements IPostAPT{
  final api1 = PostApi1Adapter();
  final api2 = PostApi2Adapter();
  @override
  List<Post> getPosts() {
      return api1.getPosts() + api2.getPosts();
  }
  
}

void main(){
  PostAPI a = PostAPI();
   final List<Post> data = a.getPosts();
   for(int i=0;i<data.length;i++){
    print(data[i].title+ " AND " + data[i].bio);
   }

}