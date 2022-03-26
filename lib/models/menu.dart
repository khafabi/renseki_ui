class Menu {
  final String name;
  final String image;

  Menu({
    required this.name,
    this.image = 'assets/images/menu_1.png',
  });

  @override
  List<Object?> get props => [name, image];
}
