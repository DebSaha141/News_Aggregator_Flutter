import 'package:spark/models/categorymodel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Top News";
  categoryModel.topic = "news";
  categoryModel.image = "assets/images/breaking-news.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Technology";
  categoryModel.topic = "tech";
  categoryModel.image = "assets/images/tech.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.topic = "sport";
  categoryModel.image = "assets/images/sports.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Gaming";
  categoryModel.topic = "gaming";
  categoryModel.image = "assets/images/gaming.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "World";
  categoryModel.topic = "world";
  categoryModel.image = "assets/images/world.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Politics";
  categoryModel.topic = "politics";
  categoryModel.image = "assets/images/politics1.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Economics";
  categoryModel.topic = "economics";
  categoryModel.image = "assets/images/Economics.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.topic = "business";
  categoryModel.image = "assets/images/business.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Finance";
  categoryModel.topic = "finance";
  categoryModel.image = "assets/images/finance.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Food";
  categoryModel.topic = "food";
  categoryModel.image = "assets/images/food.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
