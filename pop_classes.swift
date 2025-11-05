protocol BankAccountProtocol {
    var Balance: Double { get }

    mutating func deposit(_ amount: Double)
    mutating func withdraw(_ amount: Double) throws
}

class BankAccount: BankAccountProtocol {
    private var CurrentBalance: Double = 0.0

    var Balance: Double {
        return CurrentBalance
    }

    func deposit(_ amount: Double) {
        if amount > 0 {
            CurrentBalance += amount
        } else {
            fatalError("Invalid Amount")
        }
    }

    func withdraw(_ amount: Double) throws {
        guard amount > 0 else {
            throw Bankerror.invalidAmount
        }

        guard CurrentBalance >= amount else {
            throw Bankerror.insufficientBalance
        }

        CurrentBalance -= amount
        print("Withdrawn: $\(amount)")
    }
}

enum Bankerror: Error {
    case invalidAmount
    case insufficientBalance
}

let account = BankAccount()
account.deposit(1000)
print("Current balance: $\(account.Balance)")

do {
    try account.withdraw(500)
    print("Current balance: $\(account.Balance)")
} catch {
    print("Error: \(error)")
}

/*
Key Improvements in the Protocol:

mutating keyword: Required for value types (structs) that might want to conform

Error throwing: Better than silent failures

Read-only property: More Swifty than a getBalance() method

Better naming: currentBalance is clearer than just balance
*/

/*
guard is a Swift control flow statement that provides early return and safety checks. It's often called a "guardian" that protects your code from invalid states.

func processUser(name: String?, age: Int?) {
    guard let userName = name else {
        print("Name is nil")
        return
    }

    guard let userAge = age else {
        print("Age is nil")
        return
    }

    guard userAge >= 18 else {
        print("Too young")
        return
    }

    // Main logic - no nesting!
    print("Welcome, \(userName)!")
}
*/
