class SectionDetailsModel{
  int ?section_id;
  String ?content;
  String? description;
  String ?reference;
  String ?count;

  SectionDetailsModel({
    required this.section_id,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });
  SectionDetailsModel.fromJson(Map<String,dynamic>json){
  section_id=json['section_id'];
  content=json['content'];
  description=json['description'];
  reference=json['reference'];
  count=json['count'];
  }
}