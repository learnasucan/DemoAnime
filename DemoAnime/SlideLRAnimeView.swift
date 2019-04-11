//
//  SlideLRAnimeView.swift
//  DemoAnime
//
//  Created by OJASWI DEWANGAN on 11/04/19.
//  Copyright © 2019 Thyrocare. All rights reserved.
//

import UIKit

class SlideLRAnimeView: UIView {
    
    enum Direction: Int {
        case FromLeft = 0
        case FromRight = 1
        case FromTop = 2
        case FromBottom = 3 
    }
    
    @IBInspectable var direction: Int = 3
    @IBInspectable var delay: Double = 2.0
    
    override func layoutSubviews() {
        
        initSetup()
        didAnimateUI()
    }
    
    func initSetup(){
        
        if let s = self.superview {
            
            switch self.direction {
                
            case Direction.FromLeft.rawValue :
                self.center.x -= s.bounds.width
            //First it is kept in left side <----
            case Direction.FromRight.rawValue :
                self.center.x += s.bounds.width
            //First it is kept in right side ---->
            case Direction.FromTop.rawValue:
                self.center.y -= s.bounds.height
            //First it is kept in upper side ^----
            case Direction.FromBottom.rawValue:
                self.center.y += s.bounds.height
            default :
                fatalError()
            }
        }
        
        
    }
    
    
    func didAnimateUI(){
        
        UIView.animate(withDuration: 4) {
            if let s = self.superview {
                
                switch self.direction {
                    
                case Direction.FromLeft.rawValue :
                    self.center.x += s.bounds.width
                //After it is move from left to center side ---->
                case Direction.FromRight.rawValue :
                    self.center.x -= s.bounds.width
                //After it is move from Right to center side <----
                case Direction.FromTop.rawValue:
                    self.center.y += s.bounds.height
                case Direction.FromBottom.rawValue:
                    self.center.y -= s.bounds.height
                default :
                    fatalError()
                }
            }
            
        }
        
    }
    
}
