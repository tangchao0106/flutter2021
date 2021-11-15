class UserEntity {
  String? errorMsg;
  int? errorCode;

  UserEntity({this.errorMsg, this.errorCode});

  UserEntity.fromJson(Map<String, dynamic> json) {
    errorCode=json["errorCode"];
    errorMsg=json["errorMsg"];

  }
}
//在模型类中序列化JSON
//我们可以通过引入一个简单的模型类(model class)来解决前面提到的问题，我们称之为User。在User类内部，我们有：
//
//一个User.fromJson 构造函数, 用于从一个map构造出一个 User实例 map structure
//一个toJson 方法, 将 User 实例转化为一个map.
//这样，调用代码现在可以具有类型安全、自动补全字段（name和email）以及编译时异常。如果我们将拼写错误或字段视为int类型而不是String， 那么我们的应用程序就不会通过编译，而不是在运行时崩溃