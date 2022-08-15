import UIKit

struct Message {
    let from: String
    let to: String
    let subject: String
}

class Transmitter {
    var nextLink: Transmitter?
    required init() {}
    func sendMessage(message:Message) {
        if (nextLink != nil) {
            nextLink!.sendMessage(message: message)
        } else {
            print("End of chain reached. Message not sent")
        }
    }
    
    class func matchEmailSuffix(message:Message) -> Bool {
        // TODO: Refactor time. Put your logic used before in this new method
        let splitEmail = message.to.components(separatedBy: "@")
        if let domain = splitEmail.last {
            if domain.contains("students") {
                return false
            } else {
                return true
            }
        }
        fatalError()
    }
    
    class func createChain() -> Transmitter? {
        let transmitterClasses: [Transmitter.Type] = [PriorityTransmitter.self, LocalTransmitter.self, RemoteTransmitter.self]
        var link:Transmitter?
        for tClass in transmitterClasses.reversed() {
            let existingLink = link
            link = tClass.init()
            link?.nextLink = existingLink
        }
        return link
    }
}

class LocalTransmitter: Transmitter  {
    override func sendMessage(message: Message) {
        if (Transmitter.matchEmailSuffix(message: message)) {
            print("Message to \(message.to) sent locally")
        } else {
            super.sendMessage(message: message);
        }
    }
}

class RemoteTransmitter: Transmitter {
    override func sendMessage(message: Message) {
        if (!Transmitter.matchEmailSuffix(message: message)) {
            print("Message to \(message.to) sent remotely")
        } else {
            super.sendMessage(message: message)
        }
    }
}

class PriorityTransmitter: Transmitter {
    override func sendMessage(message: Message) {
        if (message.subject.hasPrefix("Priority")) {
            print("Message to \(message.to) sent as priority")
        } else {
            super.sendMessage(message: message)
        }
    }
}

let messages = [
    Message(from: "adriana@ms.com", to: "mitchell@ms.com", subject: "MOB Courses"),
    Message(from: "adriana@ms.com", to: "jess@students.com", subject: "TA Updates"),
    Message(from: "ashu@ms.com", to: "all@ms.com", subject: "Priority: All-Hands Meeting")
]

if let chain = Transmitter.createChain() {
    for msg in messages {
        chain.sendMessage(message: msg)
    }
}
