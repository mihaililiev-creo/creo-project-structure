class ExampleModel {
  ExampleModel({
    required this.name,
    required this.subscriptionPlan,
    required this.age,
    required this.isExample,
    this.numberOfOrders,
  });

  String name;
  SubscriptionPlan subscriptionPlan;
  int age;
  bool isExample;
  int? numberOfOrders;
}

enum SubscriptionPlan { free, premium }
