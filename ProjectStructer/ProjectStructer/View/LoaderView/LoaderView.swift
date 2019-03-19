//
//  LoaderView.swift
//  ProjectStructer
//
//  Created by PIYUSH  GHOGHARI on 19/03/19.
//  Copyright © 2019 AK_Apps. All rights reserved.
//
import UIKit

class LoaderView: UIView {

    // MARK: Shared Instance
    static let shared = LoaderView()
    @IBOutlet var view: LoaderView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        instanceFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func instanceFromNib() {
        view = UINib(nibName: "LoaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? LoaderView
        view.frame = CGRect(x: 0, y: 0, width: Constants.SCREEN_SIZES.WIDTH, height: Constants.SCREEN_SIZES.HEIGHT)
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
}
