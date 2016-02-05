import Quick
import Nimble
import OrangeFramework

protocol TestProtocol {}
class TestClass: TestProtocol {}
struct TestStruct {}

class DependencySpec: QuickSpec {
  override func spec() {
    
    describe("dependency by class type") {
      it("resolve after register") {
        Dependency.register(TestClass.self, lifetime: .Transient, constructor: {
          return TestClass()
        })
        expect(Dependency.resolve(TestClass.self)).toNot(raiseException())
      }
      it("resolve with exception after remove") {
        Dependency.remove(TestClass.self)
        expect(Dependency.resolve(TestClass.self)).to(raiseException())
      }
    }

    describe("dependency by protocol type") {
      it("resolve after register") {
        Dependency.register(TestProtocol.self, lifetime: .Transient, constructor: {
          return TestClass()
        })
        expect(Dependency.resolve(TestProtocol.self)).toNot(raiseException())
      }
    }
    
    describe("dependency by value type") {
      it("resolve after register") {
        Dependency.register(TestStruct.self, lifetime: .Transient, constructor: {
          return TestStruct()
        })
        expect(Dependency.resolve(TestStruct.self)).toNot(raiseException())
      }
    }
    
  }
}
