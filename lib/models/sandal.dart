class Sepatu {
  late String foto;

  Sepatu({required this.foto});

  static List<Sepatu> getSepatu() {
    List<Sepatu> sepatuSaya = [
      Sepatu(foto: "Green 1.png"),
      Sepatu(foto: "nike main.png"),
      Sepatu(foto: "Shoe 1.png"),
      Sepatu(foto: "toppng.png"),
      Sepatu(foto: "Yellow Shoe.png"),
    ];
    return sepatuSaya;
  }
}
