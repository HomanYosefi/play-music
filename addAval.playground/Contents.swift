import Foundation

func isPrime(_ n: Int) -> Bool {
    if n <= 1 { return false }
    if n <= 3 { return true }
    if n % 2 == 0 || n % 3 == 0 { return false }
    
    var i = 5
    let sqrtN = Int(Double(n).squareRoot())
    while i <= sqrtN {
        if n % i == 0 || n % (i + 2) == 0 { return false }
        i += 6
    }
    return true
}

func findPrimes() {
    var number = 2
    var row = 1
    
    // برای افزایش سرعت، خروجی‌ها را ذخیره کنید و یکجا چاپ کنید
    var results = [String]()
    
    while true {
        if isPrime(number) {
            results.append("\(row)- \(number)")
            row += 1
            
            // چاپ دسته‌ای هر 1000 مورد
            if row % 1000 == 0 {
                print(results.joined(separator: "\n"))
                results.removeAll()
            }
        }
        number += 1
    }
    
    // چاپ باقیمانده موارد
    if !results.isEmpty {
        print(results.joined(separator: "\n"))
    }
}

// اجرا در حالت release با تعداد محدود
findPrimes()
