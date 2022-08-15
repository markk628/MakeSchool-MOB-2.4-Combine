import UIKit

enum ComponentType {
    case button
    case label
    case image
}

protocol ComponentFactory {
    //this is the factory method
    func createView(component: ComponentType) -> UIView
}

//over simplified subclasses as examples
//when instantiated, these will be concrete products from the factory
class SettingsButton: UIButton {
    init() {
        super.init(frame: .zero)
        print("Button Created")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class SettingsLabel: UILabel{
    init() {
        super.init(frame: .zero)
        print("Label Created")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class SettingsImage: UIImageView{
    init() {
        super.init(frame: .zero)
        print("Image Created")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//this class will be the creator
//it will apply logic and  decide what needs to be instantiated based on given arguments

class SettingsComponentFactory: ComponentFactory {
    func createView(component: ComponentType) -> UIView {
        switch component {
        case .button:
            return SettingsButton()
        case .label:
            return SettingsLabel()
        case .image:
            return SettingsImage()
        }
    }
}

let settingsFactory = SettingsComponentFactory()
settingsFactory.createView(component: .button)
