class User{
  String id;
  String nom;
  String prenom;
  String tel;
  String email;
  String mdp;
  String photo;
  User({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.tel,
    required this.mdp,
    required this.photo
  });
  factory User.fromMap(Map<String, dynamic> data) {
    return User(
        id: data["id"],
        nom: data['nom'],
        prenom: data['prenom'],
        email: data["email"],
        tel: data["tel"],
        mdp: data["mdp"],
        photo: data["photo"],
       );
  }
}