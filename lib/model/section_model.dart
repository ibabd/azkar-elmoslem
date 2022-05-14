class SectionModel{
  int ?id;
  String ? name;
  SectionModel({this.id,this.name});
  SectionModel.fromJJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
  }
}