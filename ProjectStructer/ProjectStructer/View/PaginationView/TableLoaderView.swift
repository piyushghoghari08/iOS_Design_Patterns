//
//  TableLoaderView.swift
//  ProjectStructer
//
//  Created by PIYUSH  GHOGHARI on 19/03/19.
//  Copyright © 2019 AK_Apps. All rights reserved.
//

import UIKit

class TableLoaderView: UIView {
    
    @IBOutlet var view: TableLoaderView!
    static let shared = TableLoaderView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instanceFromNib()
    }

    func instanceFromNib() {
        view = UINib(nibName: "TableLoaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TableLoaderView
        view.frame = CGRect(x: 0, y: 0, width: Constants.SCREEN_SIZES.WIDTH, height: 40)
        addSubview(view)
    }
    
    func show() {
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.addSubview(self)
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.removeFromSuperview()
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

}
