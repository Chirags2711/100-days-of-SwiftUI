protocol Building {
    var numRooms: Int{ get }
    var cost: Int{ get }
    var agentName: String { get }
    func salesSummary()
}
extension Building {
    func salesSummary(){
        print("Sales summary: \n \(numRooms) \n \(cost) \n \(agentName)")
    }
}
struct House: Building {
    var numRooms: Int
    
    var cost: Int
    
    var agentName: String
    
    func salesSummary() {
        print("House \n NumRooms: \(numRooms) \n Cost: \(cost) \n AgentName: \(agentName)")
    }
    
    
}
struct Office: Building {
    var numRooms: Int
    
    var cost: Int
    
    var agentName: String
    
//    func salesSummary() { //Uncomment to provide specific implementation(no need to write override)
//        print("Office \n NumRooms: \(numRooms) \n Cost: \(cost) \n AgentName: \(agentName)")
//    }
}

let house = House(numRooms: 4, cost: 100_000, agentName: "House Agent")
let office = Office(numRooms: 4, cost: 100_000, agentName: "Office Agent")
house.salesSummary()
office.salesSummary()
