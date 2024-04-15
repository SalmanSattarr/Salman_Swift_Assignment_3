import Foundation

//******************************************************************* Super Class "Ship"

class Ship {
    var name: String
    var year: Int
    var countryOfOrigin: String
    
    init(name: String, year: Int, countryOfOrigin: String) {
        self.name = name
        self.year = year
        self.countryOfOrigin = countryOfOrigin
        
        }
        func printShip() {
            print("name: \(name)" + "year: \(year)" + "Country of Origin: \(countryOfOrigin)")
        }
}
//******************************************************************** End of Super Class and start of inherited class "Cruisehip

class CruiseShip: Ship {
    let maxCapacity: Int
    let oceanofOperation: String = "Atlantic"
    var currentPassengerCount: Int = 5
    
    init(name: String, year: Int, countryOfOrigin: String, maxCapacity: Int) {
        self.maxCapacity = maxCapacity
        super.init(name: "Queen of the Seas", year: 2020, countryOfOrigin: "Canada")
    }
    func addPeople() -> Void {
        while (currentPassengerCount <= maxCapacity) {
            currentPassengerCount = currentPassengerCount + 1
        }
    }
    func printCount() {
        print("Total passenger count: \(currentPassengerCount)")
    }
}
//******************************************************** End of Subclass "CruiseShip" and start of inherited class "CargoShip"

class CargoShip: Ship {
    var maxCargoCapacity: Int
    var currentCargoCount: Int
    var isInternational: Bool
    
    init(maxCargoCapacity: Int, currentCargoCount: Int, isInternational: Bool, name: String, year: Int, countryOfOrigin: String) {
        self.maxCargoCapacity = maxCargoCapacity
        self.currentCargoCount = currentCargoCount
        self.isInternational = isInternational
        super.init (name: name, year: year, countryOfOrigin: countryOfOrigin)
    }
    func addCargo() -> Void {
        repeat {
            currentCargoCount = currentCargoCount + 1
        } while currentCargoCount <= maxCargoCapacity
    }
    func printCargo() {
        print("The value of current Cargo at the moment is: \(currentCargoCount)")
    }
}
//******************************************************** End of Subclass "CargoShip" and start of inherited class "PirateShip"

class PirateShip: Ship {
    let maxTreasureCapacity: Int = 25
    var currentTreasureCount = Array(repeating: 1, count: 20) //page 146 book
    var numberOfCannons: Int = 4_000_000_000_000
    
    override init(name: String, year: Int, countryOfOrigin: String) {
        super.init(name: name, year: year, countryOfOrigin: countryOfOrigin)
    }
    func arraySum(_ array: [Int]) -> Int {
        var sumTotal = 0
        for i in array {
            sumTotal += i
        }
        return sumTotal
    }
    func addTreasure()-> Void {
        if arraySum(Array(repeating: 1, count: 20)) < maxTreasureCapacity {
            currentTreasureCount.append(1)
        }
    }
    func allTotal() -> Int {
        var sumTotal = 0
        for i in currentTreasureCount {
            sumTotal += i
        }
        return sumTotal
    }
    func printCurrTresCount(){
        print("Treasure sits at a value of: \(allTotal())")
        }
}
//******************************************************************************************** End of Subclass "PirateShip"

// instance of class "PirateShip". The acutal instance/object stays in memory pool somewhere called heap and the variable reference stays on stack pointing to the instance. Stacks operations gets computed quickly without much downtime as oppose to heap.

let Salman = PirateShip(name: "Black Skull", year: 1786, countryOfOrigin: "UK")

// The following shows superclass properties are accessible in subclass when called upon but in order to do so we need to use superinit or override init to create those before accessing

print("Name: \(Salman.name)")
print("Year: \(Salman.year)")
print("Country of Origin: \(Salman.countryOfOrigin)")

// Functions local to subclass "PirateShip"

Salman.addTreasure()
Salman.printCurrTresCount()

Salman.addTreasure()
Salman.printCurrTresCount()

Salman.addTreasure()
Salman.printCurrTresCount()

Salman.addTreasure()
Salman.printCurrTresCount()

Salman.addTreasure()
Salman.printCurrTresCount()

/*Remarks: Could have used conditional statement and be done with it by satisfying assignemnt requirements but decided to use array for currentTreasureCount, declared it an array and assigned value off "1" as repeating number and then created a function to add array values to yield a sum integer, then do a comparision check with maxtreasurevalue, if less than maxvalue I appended the array by one and caculated the values of the array again to output the total sum as a currentTreasureCount which is what is printed as "Treasure sits at value". The challenge I encountered was I had to control two values to satisfy what is asked in the assignment which is to stay under maxcapacity of treasure.In other words I have to control variable at two parts in code so that it wont go above maxcapacity whch I have set to 25 */
