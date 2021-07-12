abstract class A {
  int? aa;

  void a() {
    print('a');
  }

  void a1();
}

class A1 extends A {
  @override
  void a1() {}
}

/// B实现A的话，则需要重写A中的方法和属性
class B implements A {
  @override
  int? aa;

  @override
  void a() {}

  @override
  void a1() {}
}

class C {
  int? cc;

  void c() {
    print('c');
  }
}

class C1 extends C {
  c();
}

class D implements B {
  @override
  int? aa;

  @override
  void a() {}

  @override
  void a1() {}
}

class E extends A with C {
  a();

  c();

  @override
  void a1() {}
}
