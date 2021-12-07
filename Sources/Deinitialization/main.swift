// Swift does automatic reference counting, so no manual deinitialization is needed

// classes can have a deinitializer to run hooks before the memory is freed
class Finalized {
    // Empty initializer
    init() {
    }

    // Empty deinitializer. Note that it takes no arguments
    deinit {
    }
}

class Bank {
    static var coinsInBank = 10_000

    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numCoinsToVend = min(coinsInBank, numberOfCoinsRequested)
        coinsInBank -= numCoinsToVend
        return numCoinsToVend
    }

    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {

}
