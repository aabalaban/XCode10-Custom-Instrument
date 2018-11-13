import UIKit
import os

class ViewController: UIViewController {
    var log: OSLog = OSLog(subsystem: "just.a.sample", category: "Experiment")
    
    @IBAction func didTapOnEvent(_ sender: Any) {
        os_signpost(.event, log: self.log, name: "Event", "Tap at %s", Date().description)
    }
    
    @IBAction func didTapOnRandomTimeline(_ sender: Any) {
        let signpost = OSSignpostID(log: self.log)
        os_signpost(.begin, log: self.log, name: "Timeline", signpostID: signpost, "Start at %s", Date().description)
        let randomDuration = TimeInterval.random(in: 0..<5)
        DispatchQueue.main.asyncAfter(deadline: .now() + randomDuration) {
            os_signpost(.end, log: self.log, name: "Timeline", signpostID: signpost, "End at %s, Duration: %f", Date().description, randomDuration)
        }
    }
}
