// https://github.com/Quick/Quick

import Quick
import Nimble
import Nimble_Snapshots
import Masu

class MasuSpec: QuickSpec {
    override func spec() {
        describe("view matching") {
            
            let sizes: [CGSize] = [
                CGSizeMake(200, 200),
                CGSizeMake(200, 100),
                CGSizeMake(100, 200)
            ]
            
            for size in sizes as [CGSize] {
                context(String(format: "size %.0fx%.0f", size.width, size.height)) {
                    var masu: Masu!
                    
                    beforeEach {
                        masu = Masu(frame: CGRectMake(0, 0, size.width, size.height))
                    }
                    
                    it("matches default") {
                        expect(masu).to(haveValidSnapshot())
                    }
                    
                    it("matches background") {
                        masu.backgroundColor = UIColor(red: 0.75, green: 1, blue: 0.75, alpha: 1)
                        expect(masu).to(haveValidSnapshot())
                    }
                    
                    it("matches label") {
                        masu.text = "Label"
                        expect(masu).to(haveValidSnapshot())
                    }
                }
            }
        }
    }
}
