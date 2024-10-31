import 'package:spark/models/categorymodel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Top News";
  categoryModel.image = "assets/images/breaking-news.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Technology";
  categoryModel.image = "assets/images/tech.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.image = "assets/images/sports.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Gaming";
  categoryModel.image = "assets/images/gaming.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "World";
  categoryModel.image = "assets/images/world.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Politics";
  categoryModel.image = "assets/images/politics1.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.image = "assets/images/business.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Finance";
  categoryModel.image = "assets/images/finance.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Food";
  categoryModel.image = "assets/images/food.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
