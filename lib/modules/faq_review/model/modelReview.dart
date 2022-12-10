class MyReviewData {
    String username;
    DateTime dateAdd;
    String title;
    String review;

  MyReviewData(
    this.username,
    this.dateAdd,
    this.title,
    this.review,
  );
}
// List untuk menyimpan data dari form
List<MyReviewData> listBudget = <MyReviewData>[];