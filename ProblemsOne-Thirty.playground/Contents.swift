import UIKit

class List<T> {
    var value: T
    var nextItem: List<T>?
    
    //========================================
    //MARK: - Initializers
    //========================================
    
    convenience init?(_ values: T...) {
        self.init(Array(values))
    }
    
    init?(_ values: [T]) {
        guard let first = values.first else {
            return nil
        }
        value = first
        nextItem = List(Array(values.suffix(from: 1)))
    }
}

//Problem one
extension List {
    var last: T? {
        repeat {
            if let nextValue = nextItem?.value {
                value = nextValue
            } else {
                return nil
            }
            nextItem = nextItem?.nextItem
        } while(nextItem != nil)
        return value
    }
}

List(1, 2, 3, 4)?.last

//Problem two
extension List {
    var penultimate: T? {
        repeat {
            if let nextValue = nextItem?.value {
                value = nextValue
            } else {
                return nil
            }
            nextItem = nextItem?.nextItem
        } while(nextItem?.nextItem != nil)
        return value
    }
}

List(1, 2, 3, 4)?.penultimate

//Problem three
extension List {
    subscript(index: Int) -> T? {
        var count = 0
        while(count != index) {
            if let nextValue = nextItem?.value {
                value = nextValue
            } else {
                return nil
            }
            nextItem = nextItem?.nextItem
            count += 1
        }
        return value
    }
}

let list = List(1, 2, 3, 4)!
list[2]

//Problem four
extension List {
    var length: Int {
        var count = 1
        while(nextItem != nil) {
            nextItem = nextItem?.nextItem
            count += 1
        }
        return count
    }
}

List(1, 2, 3, 4)?.length

//Problem five
extension List {
    func reverse() {
        
    }
}

List(1, 2, 3, 4)?.reverse()
