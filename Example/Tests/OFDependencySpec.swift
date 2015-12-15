import Quick
import Nimble
import OrangeFramework

protocol TestProtocol {}
class TestClass: TestProtocol {}
struct TestStruct {}

class OFDependencySpec: QuickSpec {
  override func spec() {
    
    describe("dependency by class type") {
      it("resolve after register") {
        OFDependency.registerWithType(TestClass.self, mode: .Factory) {
          return TestClass()
        }
        expect(OFDependency.resolveByType(TestClass.self)).toNot(raiseException())
      }
      it("resolve with exception after remove") {
        OFDependency.removeForType(TestClass.self)
        expect(OFDependency.resolveByType(TestClass.self)).to(raiseException())
      }
    }

    describe("dependency by protocol type") {
      it("resolve after register") {
        OFDependency.registerWithType(TestProtocol.self, mode: .Factory) {
          return TestClass()
        }
        expect(OFDependency.resolveByType(TestProtocol.self)).toNot(raiseException())
      }
    }
    
    describe("dependency by value type") {
      it("resolve after register") {
        OFDependency.registerWithType(TestStruct.self, mode: .Factory) {
          return TestStruct()
        }
        expect(OFDependency.resolveByType(TestStruct.self)).toNot(raiseException())
      }
    }
    
  }
}
