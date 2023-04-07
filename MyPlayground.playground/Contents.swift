import UIKit

/*
 cần truyền dữ liệu từ ViewA qua ViewB
 có 2 cách closure và delegate
 */

//cách 1 Delegate
protocol ViewADelegate {
    func passData(_ data: Int)
}

class ViewA {
    var delegate: ViewADelegate?
    init() {
    }
    
    func passData() {
        self.delegate?.passData(23)
    }
}

class ViewB {
    let viewA: ViewA?
    var dataB: Int?
    init() {
        viewA = ViewA()
        viewA?.delegate = self
        viewA?.passData()
    }
    
}

extension ViewB: ViewADelegate {
    func passData(_ data: Int) {
        self.dataB = data
    }
}

var viewB = ViewB()
print(viewB.dataB)


// Cách 2 closure

class UIViewA {
    var closure: ((Int) -> Void)?
    init() {
        
    }
    func passData() {
        self.closure?(123)
    }
}

class UIViewB {
    var uiViewA: UIViewA?
    var data: Int?
    init() {
        uiViewA = UIViewA()
        uiViewA?.closure = { [weak self] data in
            self?.data = data
        }
        uiViewA?.passData()
    }
}

var uiViewB = UIViewB()
print(uiViewB.data)
