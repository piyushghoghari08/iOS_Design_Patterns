//
//  Utilities.swift
//  ProjectStructer
//
//  Created by PIYUSH  GHOGHARI on 19/03/19.
//  Copyright © 2019 AK_Apps. All rights reserved.
//
import UIKit
import CoreLocation


class Utilities: NSObject {
    class var sharedInstance : Utilities {
        struct Static {
            static let instance : Utilities = Utilities()
        }
        return Static.instance
    }
    //MARK: Is valid string
    class func isValidString(str : String?) -> Bool {
        return (str ?? "").trimmingCharacters(in: .whitespacesAndNewlines).count > 0
    }
    
    // Return IP address of WiFi interface (en0) as a String, or `nil`
    class func getIPAddress() -> String? {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                
                let interface = ptr?.pointee
                let addrFamily = interface?.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    if let name: String = String(cString: (interface?.ifa_name)!), name == "en0" {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        return address
    }
    
    //MARK: To show alert
    class func showAlert(withTitle title : String, withMessage message: String?, parentController parent : UIViewController, okBlock : @escaping () -> (), cancelBlock : (() -> ())?) {
        
        let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction : UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (alert : UIAlertAction) in
            okBlock()
        }
        
        if (cancelBlock != nil) {
            let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default) { (alert : UIAlertAction) in
                cancelBlock!()
            }
            alert.addAction(cancelAction)
        }
        alert.addAction(okAction)
        parent.present(alert, animated: true) {
            
        }
    }
    
    //MARK: To validate Email Address
    static func isValidEmail(_ strInput:String?) -> Bool {
        if isValidString(str: strInput) {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: strInput)
        } else {
            return false
        }
    }
    
    //MARK: - to validate full name
    static func isValidFullname(_ strInput:String?) -> Bool {
        if isValidString(str: strInput) {
            let fullNameRegEx = "[A-Z][a-zA-Z]*"
            let fullNameTest = NSPredicate(format:"SELF MATCHES %@", fullNameRegEx)
            return fullNameTest.evaluate(with: strInput)
        } else {
            return false
        }
    }
    
    static func isValidPhoneNo(_ strInput:String?) -> Bool {
        if isValidString(str: strInput) {
            let phoneNoRegEx = "[0-9-+()]{8,8}"
            let phoneNoTest = NSPredicate(format:"SELF MATCHES %@", phoneNoRegEx)
            return phoneNoTest.evaluate(with: strInput)
        } else {
            return false
        }
    }
    
    static func getTrimmedString(_ strInput : String) -> String {
        return strInput.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    static func isValidString(_ strInput : String?) -> Bool {
        return getTrimmedString(strInput ?? "") != ""
    }

}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

