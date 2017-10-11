//
//  TouchbleView.swift
//  TouchableDelegation
//
//  Created by Eliel A. Gordon on 10/5/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit

protocol TouchDelegate: class {
    func didTouch()
}

class TouchbleView: UIView {
    
    weak var touchDelegate: TouchDelegate?
    
    let touchGesture = UITapGestureRecognizer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        touchGesture.addTarget(self, action: #selector(handleTap(tap:)))
        
        self.addGestureRecognizer(touchGesture)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        touchGesture.addTarget(self, action: #selector(handleTap(tap:)))
        self.addGestureRecognizer(touchGesture)
        
    }
    
    // Called when view is tapped
    @objc func handleTap(tap: UITapGestureRecognizer) {
        //print("Tapped")
        touchDelegate?.didTouch()
    }

}
