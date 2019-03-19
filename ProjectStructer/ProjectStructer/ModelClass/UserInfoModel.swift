//
//  UserInfoModel.swift
//  ProjectStructer
//
//  Created by PIYUSH  GHOGHARI on 19/03/19.
//  Copyright © 2019 AK_Apps. All rights reserved.
//

import UIKit

class UserInfoModel: NSObject {
    
    var strUserID           = String()
    var strFullName         = String()
    var strMobileNo         = String()
    var strEmail            = String()
    var strPassword         = String()
    var strUserProfileURL   = String()
    var strIsVerify         = String()
    var strCreatedAt        = String()
    var imgProfileData      = Data()
    
    override init() {
        super.init()
    }
    
    init(dicUserInfo : [String : Any]){
        if let userId = (dicUserInfo as AnyObject).value(forKey: "user_id") as? String {
            self.strUserID = userId
        }
        if let fullName = (dicUserInfo as AnyObject).value(forKey: "full_name") as? String {
            self.strFullName = fullName
        }
        if let mobileNo = (dicUserInfo as AnyObject).value(forKey: "mobile_number") as? String {
            self.strMobileNo = mobileNo
        }
        if let email = (dicUserInfo as AnyObject).value(forKey: "email") as? String {
            self.strEmail = email
        }
        if let profile = (dicUserInfo as AnyObject).value(forKey: "profile") as? String {
            self.strUserProfileURL = profile
        }
        if let isVerify = (dicUserInfo as AnyObject).value(forKey: "is_verify") as? String {
            self.strIsVerify = isVerify
        }
        if let createdAt = (dicUserInfo as AnyObject).value(forKey: "created_at") as? String {
            self.strCreatedAt = createdAt
        }
    }
    
    
    /*=================================================================================
     * Function Name: Login Service Call
     * Function Parameter: strEmail,strPassword
     * Function Return Type: objUserInfo and Auth token
     * Function Purpose: Login Service response get token store into NSUserDefault and
     *                   Another user details are store into UserInfo Model.
     ==================================================================================*/
    func Login(successBlock:@escaping (_ objUserInfo: UserInfoModel) -> (),
               errorBlock:@escaping (_ strMsg: String) -> ()) {
        let parameters = [
            "email"             : strEmail,
            "password"          : strPassword,
            "device_type"       : "iOS",
            "device_token"      : "No_Device_Token"
        ]
        ServiceManager.sharedInstance.callWebService(withURL: URL(string: Constants.SERVICES.LOGIN)!,
                                                     withMethod: Constants.REQUEST_METHOD_NAME.POST,
                                                     withParameter: parameters,
                                                     withShowLoader: true,
                                                     successBlock: { (dictResponse : [String : AnyObject]) in
                                                        print("=======================================================")
                                                        print("\(Constants.SERVICES.LOGIN) Response : \(dictResponse)")
                                                        
                                                        if (dictResponse["code"] as? String == "200") {
                                                            if let dicData = dictResponse["response"]as? [String : Any]{
                                                                if let _ = dicData["token"] as? String{
                                                                    Constants.USER_DEFAULTS.OBJ_USER_DEFAULTS.set(dicData["token"] as? String, forKey: Constants.USER_DEFAULTS.STR_TOKEN)
                                                                }
                                                                if let dicUserDetails = dictResponse["response"]as? [String : Any]{
                                                                    let objeUserInfo = UserInfoModel(dicUserInfo: dicUserDetails)
                                                                    DanDin.shared.objUserInfo = objeUserInfo
                                                                    successBlock(objeUserInfo)
                                                                }
                                                            }
                                                        }else{
                                                            Constants.USER_DEFAULTS.OBJ_USER_DEFAULTS.removeObject(forKey: Constants.USER_DEFAULTS.STR_EMAIL)
                                                            Constants.USER_DEFAULTS.OBJ_USER_DEFAULTS.removeObject(forKey: Constants.USER_DEFAULTS.STR_PASSWORD)
                                                            errorBlock(dictResponse["message"] as! String)
                                                        }
        }) { (strMSG : String) in
            print("Error message : \(strMSG)")
            errorBlock(strMSG)
        }
    }
}
