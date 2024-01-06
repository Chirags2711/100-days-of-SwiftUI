enum GearDirection{
    case up, down, neutral
}
struct Car{
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int{ //if private, memberwise initializer is gone
        didSet{
            if currentGear < 0 {
                currentGear = 0
            }
            if currentGear > 5 {
                currentGear = 5
            }
        }
    }
    
    
    mutating func changeGear(_ direction: GearDirection){
        if direction == .up {
            currentGear += 1
        }else if direction == .down {
            currentGear -= 1
        }else {
            currentGear = 0
        }
        print("The \(model) is in gear: \(currentGear)")
    }
}

var prefect = Car(model: "Ford Prefect", numberOfSeats: 4, currentGear: 3)
prefect.changeGear(.up)
prefect.changeGear(.neutral)
prefect.changeGear(.down)
prefect.changeGear(.up)
prefect.changeGear(.up)
prefect.changeGear(.up)
prefect.changeGear(.up)
prefect.changeGear(.up)
prefect.changeGear(.up)
