//
//  ListButton.swift
//  ListView
//
//  Created by Angelos Staboulis on 31/12/19.
//  Copyright © 2019 Angelos Staboulis. All rights reserved.
//

import Foundation
import UIKit
class ListButton:UIButton{
       
    var caption:String!
    
    var selectedValue:String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
    }
    func setBkColor(color:UIColor){
        self.backgroundColor = color
    }
    func setCaption(caption:String){
        self.setTitle(caption, for: .normal)
    }
    func setCaptionColor(color:UIColor){
        self.setTitleColor(color, for: .normal)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  

    
    
}


