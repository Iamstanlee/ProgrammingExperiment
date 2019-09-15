class Items {
  String pageNo, description, btnDescription, image;
  int index;

  Items(
      {this.pageNo,
      this.description,
      this.image,
      this.btnDescription,
      this.index});
}

class ItemsListBuilder {
  List<Items> itemList = new List();

  Items item1 = new Items(
    pageNo: "Find charging stations",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
    image: "assets/images/job.png",
  );
  Items item2 = new Items(
    pageNo: "Tracking Realtime",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
    image: "assets/images/tracking.png",
  );
  Items item3 = new Items(
      pageNo: "Save Money",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
      image: "assets/images/earn_money.png",
      index: 2,
      btnDescription: "CONTINUE TO APP");

  ItemsListBuilder() {
    itemList.add(item1);
    itemList.add(item2);
    itemList.add(item3);
  }
}
