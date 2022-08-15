import UIKit

/* Step 1: Create a Subject class and Annotate a Property for Key-Value Observing */

//TODO: Create Subject class...
class Subject: NSObject {
    @objc dynamic var counter = 0
}

/* Step 2: Define an Observer class */
class Observer : NSObject {
    @objc var subjectToObserve: Subject
    var observation: NSKeyValueObservingOptions = .new

    //TODO: Add init()
    init(subject: Subject) {
        self.subjectToObserve = subject
        super.init()
        self.subjectToObserve.addObserver(self, forKeyPath: "counter", options: observation, context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        print("Notification: \(String(describing: keyPath)) = \(String(describing: change?[NSKeyValueChangeKey.newKey]!))");

    }
}
/* Step 3: Associate the Observer with the Property to Observe */
let subject = Subject()
let observer = Observer(subject: subject)

/* Step 4: Respond to a Property Change */
subject.counter += 11
subject.counter = 99

/* RESULTS - Should print:
Notification: Optional("counter") = Optional(11)
Notification: Optional("counter") = Optional(99)
*/
