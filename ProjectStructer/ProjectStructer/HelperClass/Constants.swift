//
//  Constants.swift
//  ProjectStructer
//
//  Created by PIYUSH  GHOGHARI on 19/03/19.
//  Copyright © 2019 AK_Apps. All rights reserved.
//

import UIKit
import Alamofire

class Constants: NSObject {
    
    //App details
    struct APP_DETAILS {
        static let APP_NAME = "ProjectStructer"
    }
    
    struct SCREEN_SIZES {
        static let HEIGHT = UIScreen.main.bounds.height
        static let WIDTH = UIScreen.main.bounds.width
    }
    
    //Device Type
    struct Devices {
        static let iPhone4          = (SCREEN_SIZES.HEIGHT == 480)
        static let iPhone5          = (SCREEN_SIZES.HEIGHT == 568)
        static let iPhone6          = (SCREEN_SIZES.HEIGHT == 667)
        static let iPhone6Plus      = (SCREEN_SIZES.HEIGHT == 736)
        static let iPhone_X         = (SCREEN_SIZES.HEIGHT == 812)
        static let iPhone_XS_MAX    = (SCREEN_SIZES.HEIGHT == 896)
    }
    
    struct MESSAGE {
        static let INVALID_FULL_NAME         = "Please enter valid fullname."
        static let INVALID_PHONE_NO          = "Please enter valid phone number."
        static let INVALID_EMAIL             = "Please enter valid email."
        static let INVALID_PASSWORD          = "Please enter valid password."
        static let INVALID_NEW_PASSWORD      = "Please enter valid new password."
        static let INVALID_COMPARE_PASSWORD  = "New password is not matched with currently setted password!"
        static let SELECT_PROFILE_PIC        = "Please choose your profile picture."
        static let NO_COMMENT                = "Please enter vaild comment."
        static let INVALID_TIME_SLOT         = "Please select training date and time."
    }
    
    //User Defaults
    struct USER_DEFAULTS {
        static let OBJ_USER_DEFAULTS            = UserDefaults.standard
        static let STR_TOKEN                    = "Token"
        static let STR_EMAIL                    = "EmailID"
        static let STR_PASSWORD                 = "Password"
    }
    
    //Service request method's
    struct REQUEST_METHOD_NAME {
        static let GET  = HTTPMethod.get
        static let POST = HTTPMethod.post
        static let PUT  = HTTPMethod.put
    }
    
    //Service List
    struct SERVICES {
        //BASE URL
        static let HOST_URL                      = ""
        //Authentication
        static let LOGIN                         = HOST_URL + "login"
        static let USER_REGISTER                 = HOST_URL + "userRegister"
        static let FORGOT_PASSWORD               = HOST_URL + "forgotPassword"
    }
}
