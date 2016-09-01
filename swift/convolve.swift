import Foundation

func convolve(a: [Double], _ b: [Double]) -> [Double] {
    var output = [Double](count: a.count + b.count - 1, repeatedValue: 0.0)
    for i in 0..<a.count {
        for j in 0..<b.count {
            output[i + j] += a[i] * b[j]
        }
    }
    return output
}

let a = (0..<5000).map { sin(M_PI * (Double($0) / 8.0)) }
let b = (0..<5000).map { cos(M_PI * (Double($0) / 8.0)) }

(0..<1000).forEach { _ in
    let start = NSDate()
    convolve(a, b)
    print("\(NSDate().timeIntervalSinceDate(start) * 1000.0)ms")
}