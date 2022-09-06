class CardItemModel {
  List<CardListItem> cardList = [];

  CardItemModel({required this.cardList});
}

class CardListItem {
  final String label;
  final String? IconsPath;
  final String? onNavigate;

  CardListItem(
      {required this.label,
         this.IconsPath,
        this.onNavigate});
}
