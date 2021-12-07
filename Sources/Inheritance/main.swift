// A base class does not inherit from any other class
class Vehicle {
    var currentSpeed = 0.0

    var description: String {
        return "travelling at \(currentSpeed) mph"
    }

    func makeNoise() {
        // nothing
    }
}

let someVehicle = Vehicle()
someVehicle.currentSpeed = 10.0
print("Vehicle: \(someVehicle.description)")

// A subclass inherits from a superclass.
// The new class automatically gains all the characteristics of its superclass
class Bicycle: Vehicle {
    var hasBasket = false

}

let bike = Bicycle()
bike.hasBasket = true

// Can modify members derived from the superclass
bike.currentSpeed = 15.0
print("Bicycle: \(bike.description)")

// Subclasses can themselves be subclassed
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")


// Overriding allows custom implementations of things defined in the superclass. This uses the override keyword.
class Train: Vehicle {
    // The override keyword is used to override a superclass object
    override func makeNoise() {
        print("Choo choo")
    }
}

let train = Train()
train.makeNoise()

// Properties, can be overriden as well as methods. The superclass version can always be accessed with the
// super keyword
class Car: Vehicle {
    var gear = 1

    override var description: String {
        return super.description + " in gear \(gear)"
    }

    override func makeNoise() {
        print("Vroom!")
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
car.makeNoise()


// Can use override to add property oberservers to an inherited property, which allows you to be
// notified when the value of an inherited property changes
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let autocar = AutomaticCar()
autocar.currentSpeed = 0.0
print("AutomaticCar: \(autocar.description)")
autocar.currentSpeed = 45.0
print("AutomaticCar: \(autocar.description)")

// NOTE: you can prevent overrides by prefixing a property or method with 'final'.
// You can even have a 'final class'

