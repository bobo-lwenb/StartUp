class Person {
  void eat() {
    print('Person eat');
  }
}

mixin Dance {
  void dance() {
    print('Dance dance');
  }
}

mixin Sing {
  void sing() {
    print('Sing sing');
  }
}

mixin Code on Person {
  @override
  void eat() {
    super.eat();
    print('Code eat');
  }

  void code() {
    print('Code code');
  }
}

class A extends Person with Dance, Sing {}

class B extends Person with Sing, Code {}

class C extends Person with Code, Dance {}

// class Dog with Code {}

main(List<String> args) {
  A a = A();
  a.eat();
  a.dance();
  a.sing();

  int.parse('10');
  '10'.toInt();
}

mixin D {
  void d() {
    print('D d');
  }
}

mixin D1 {
  void d() {
    print('D1 d');
  }
}

class E with D1, D {
  @override
  void d() {
    super.d();
    print('E d');
  }
}

class F {
  void a() {
    print('F a');
  }
}

class G {
  void a() {
    print('D a');
  }
}

class H {
  void a() {
    print('H a');
  }
}

class FG extends H with F, G {
  void a() {
    super.a();
    print('FG a');
  }
}

abstract class BB {
  BB() {
    print('BB Constructor');
    init();
  }

  void init() {
    print('BB init');
  }
}

mixin GB on BB {
  @override
  void init() {
    super.init();
    print('GB init');
  }
}

mixin PB on BB {
  @override
  void init() {
    super.init();
    print('PB init');
  }
}

class WFB extends BB with GB, PB {}

WFB wfb = WFB();

extension StringExtension on String {
  int toInt() {
    return int.parse(this);
  }
}

class Student {
  final String name;
  Student(this.name);
}

Student add(Student s1, Student s2) {
  return Student("${s1.name},${s2.name}");
}

extension StudentExtension on Student {
  Student operator +(Student student) {
    return Student("${this.name},${student.name}");
  }
}

void demo() {
  Student person1 = Student('lao');
  Student person2 = Student('meng');
  Student p = add(person1, person2);
  print("${p.name}");
  Student p1 = person1 + person2;
  print("${p1.name}");
}
