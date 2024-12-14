
class DataUser {

  late String name;
  late String avatar;
  late String token;

  DataUser.fromJson(Map data){
    name = data['name'];
    avatar = data['avatar'];
    token = data['token'];
  }

}