import Quick
import Nimble
import OrangeFramework

class OFLogSpec: QuickSpec {
  override func spec() {
    var logedString = ""
    let testLogger = OFLogger(logLevel: OFLogLevel.All, printer: { (flag: OFLogFlag, message: String) in
      logedString = message
      }) { (object: AnyObject?, flag: OFLogFlag, function: String, file: String, line: UInt32) -> String in
      if let object = object {
        return object.description
      } else {
        return ""
      }
    }
    OFLog.registerLogger(testLogger)
    
    describe("log") {
      context("when log is printing") {
        it("is error"){
          OFLog.error("error")
          expect(logedString).to(equal("error"))
        }
        
        it("is warning"){
          OFLog.warning("warning")
          expect(logedString).to(equal("warning"))
        }
        
        it("is info"){
          OFLog.info("info")
          expect(logedString).to(equal("info"))
        }
        
        it("is debug"){
          OFLog.debug("debug")
          expect(logedString).to(equal("debug"))
        }
        
        it("is verbose"){
          OFLog.verbose("verbose")
          expect(logedString).to(equal("verbose"))
        }
        
        it("is error object"){
          let testObject = 5
          OFLog.error(testObject)
          expect(logedString).to(equal(testObject.description))
        }
        
        it("is warning object"){
          let testObject = 6
          OFLog.warning(testObject)
          expect(logedString).to(equal(testObject.description))
        }
        
        it("is info object"){
          let testObject = 7
          OFLog.info(testObject)
          expect(logedString).to(equal(testObject.description))
        }
        
        it("is debug object"){
          let testObject = 8
          OFLog.debug(testObject)
          expect(logedString).to(equal(testObject.description))
        }
        
        it("is verbose object"){
          let testObject = 9
          OFLog.verbose(testObject)
          expect(logedString).to(equal(testObject.description))
        }
      }
    }
  }
}
