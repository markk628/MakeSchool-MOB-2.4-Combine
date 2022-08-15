enum Consentration {
    case MOB
    case FEW
    case BEW
    case DS
}

class Student {
    var name: String
    var consentration: Consentration!
    let mediator: Mediator
    
    init(name: String, consentration: Consentration, mediator: Mediator) {
        self.name = name
        self.consentration = consentration
        self.mediator = mediator
    }
    
    func send(request: Request) {
        print("\(name) sent request: \(request.message)")
        mediator.send(request: request)
    }
}

class TA {
    var name: String
    var consentration: Consentration!
    let mediator: Mediator
    
    init(name: String, consentration: Consentration, mediator: Mediator) {
        self.name = name
        self.consentration = consentration
        self.mediator = mediator
    }
    
    func receive(request: Request) {
        print("\(name) received request from \(request.student.name): \(request.message)")
    }
}

class Request {
    var message: String
    var student: Student
    
    init(message: String, student: Student) {
        self.message = message
        self.student = student
    }
}

protocol Mediator {
    func send(request: Request)
}

class CoWorkHost: Mediator {
    var students: [Student] = []
    var tas: [TA] = []
    
    func addStudent(student: Student) {
        students.append(student)
    }
    
    func addTA(ta: TA) {
        tas.append(ta)
    }
    
    func send(request: Request) {
        for ta in tas {
            if request.student.consentration == ta.consentration {
                ta.receive(request: request)
                return
            }
        }
        print("No TAs available for \(String(describing: request.student.consentration))")
    }
}

var requestManager = CoWorkHost()

var a = Student(name: "a", consentration: .MOB, mediator: requestManager)
var b = Student(name: "b", consentration: .BEW, mediator: requestManager)
var c = Student(name: "c", consentration: .FEW, mediator: requestManager)

var ta1 = TA(name: "TA1", consentration: .MOB, mediator: requestManager)
var ta2 = TA(name: "TA2", consentration: .BEW, mediator: requestManager)
var ta3 = TA(name: "TA3", consentration: .DS, mediator: requestManager)

requestManager.addStudent(student: a)
requestManager.addStudent(student: b)
requestManager.addStudent(student: c)

requestManager.addTA(ta: ta1)
requestManager.addTA(ta: ta2)
requestManager.addTA(ta: ta3)

a.send(request: Request(message: "What is closure", student: a))
b.send(request: Request(message: "What is MongoDB", student: b))
c.send(request: Request(message: "HTML is my favorite programming language", student: c))



