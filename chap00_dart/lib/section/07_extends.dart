void extendsTest(){
  Dog dog = Dog("흰둥이", 6);
  dog.eat();
}

// 부모 클래스
class Animal {
  String _name;

  Animal(this._name);

  void eat() {
    print("$_name 이(가) 밥을 먹습니다.");
  }
}

// 자식 클래스
class Dog extends Animal{
  // 나중에 초기화 (late) //set 값이 들어가야 초기화가 된다는것!
  late int _age;

  Dog(String name, int age) :   // : 초기화 리스트
      super(name) {
    this.age = age;
  }

  int get age => _age;

  set age(int value) {
    if(value <= 0){
      throw ArgumentError("나이가 너무 어려요");
    }
    _age = value;
  }
}