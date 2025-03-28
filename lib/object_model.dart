
class Objectmodel {
  final int id;
  final String target;
  final String name;
  final String image;
  final String description;
  bool isPressed = false;

  Objectmodel({
  required this.id,
  required this.target,
  required this.name,
  required this.image,
  required this.description,
  });

    static Objectmodel fromJson(Map<String, dynamic> data){
    print(data);
    return Objectmodel(id: data["id"], target: data["target"], name: data["name"], image: data["image"], description: data["description"]);
  }
}
