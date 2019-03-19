//
//  ViewController.swift
//  ProjectStructer
//
//  Created by PIYUSH  GHOGHARI on 19/03/19.
//  Copyright © 2019 AK_Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         self.userLogin()
    }

    /*=================================================================================
     * Function Name: userLogin
     * Function Parameter: emailID,Password
     * Function Return Type: Login userInformation and accessToken
     ==================================================================================*/
    func userLogin(){
        let objUserInfo = UserInfoModel()
        objUserInfo.strEmail = txtEmailAddress.text!
        objUserInfo.strPassword = txtPassword.text!
        objUserInfo.Login(successBlock: { (objUserInfoModel) in
            print("objUserInfoModel : ->\(objUserInfoModel)")
            Constants.USER_DEFAULTS.OBJ_USER_DEFAULTS.set(self.txtEmailAddress.text, forKey: Constants.USER_DEFAULTS.STR_EMAIL)
            Constants.USER_DEFAULTS.OBJ_USER_DEFAULTS.set(self.txtPassword.text, forKey: Constants.USER_DEFAULTS.STR_PASSWORD)
            self.objAppDelegate?.SucessLogin()
        }) { (strErrorMessage : String) in
            print("Error Message : ->",strErrorMessage)
            Utilities.showAlert(withTitle: Constants.APP_DETAILS.APP_NAME , withMessage: strErrorMessage, parentController: self, okBlock: { }, cancelBlock: nil)
        }
    }
    

}

