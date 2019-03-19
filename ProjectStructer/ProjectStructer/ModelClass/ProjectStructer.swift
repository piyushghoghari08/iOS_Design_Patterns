//
//  ProjectStructer.swift
//  ProjectStructer
//
//  Created by PIYUSH  GHOGHARI on 19/03/19.
//  Copyright © 2019 AK_Apps. All rights reserved.
//

import UIKit

class ProjectStructer: NSObject {
    static let shared = DanDin()
    var objUserInfo = UserInfoModel()
    
    private override init() {
        super.init()
    }
}
