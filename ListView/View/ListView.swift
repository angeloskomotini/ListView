//
//  ListView.swift
//  ListView
//
//  Created by Angelos Staboulis on 31/12/19.
//  Copyright © 2019 Angelos Staboulis. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
class ListView:UIView{
    
    var buttons=[UIButton]()
    
    var data=Array<String>()
    
    var scroll = UIScrollView()
    
    var currentFrame:CGRect!
    
    var frameArray=[CGRect]()
    
    var newleft:CGFloat!
    
    var newwidth:CGFloat!
    
    var newtop:CGFloat!
    
    var newheight:CGFloat!
    
    var selectedItem:String!
    
    @IBInspectable
    var left:CGFloat{
        get{
            return 100.0
        }
        set{
            newleft=100
        }
    }
    
    @IBInspectable
    var width:CGFloat{
        get{
            return 50.0
        }
        set{
            newwidth = 50
        }
    }
    
    @IBInspectable
    var top:CGFloat{
        get{
            return 100.0
        }
        set{
            newtop=100
        }
    }
    @IBInspectable
    var height:CGFloat{
        get{
            return 50.0
        }
        set{
            newheight = 50.0
        }
    }
    var listButton:ListButton!
    
    var lblHeader:UILabel!
    
    var lblHeaderValue:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        scroll.frame = frame
        scroll.translatesAutoresizingMaskIntoConstraints = false
    }
    func calculateFieldsRectange(){
        for countItem in 0..<data.count{
            let rect = CGRect(x:left,y:CGFloat(top)*CGFloat(countItem) + CGFloat(height),width:width,height:height)
            frameArray.append(rect)
        }
    }
    func setupSelectedField()->UILabel{
        lblHeader = UILabel(frame:CGRect(x:180,y:100,width:200,height:50))
        lblHeader.text = "Selected Value"
        lblHeader.font = UIFont(name: "Arial", size: 12)
        return lblHeader
    }
    func setupSelectedFieldValue()->UILabel{
           lblHeaderValue = UILabel(frame:CGRect(x:200,y:100,width:200,height:100))
           lblHeaderValue.text = ""
           return lblHeaderValue
    }
    func setupListButton(item:Int)->ListButton{
        listButton = ListButton()
        listButton.frame = frameArray[item]
        listButton.setCaption(caption:data[item])
        listButton.tag = item
        listButton.setCaptionColor(color: .blue)
        listButton.setBkColor(color: .red)
        listButton.addTarget(self, action: #selector(clickItem(sender:)), for: .allEvents)
        return listButton
    }
    func createList(){
        let count = data.count
        scroll.contentSize = CGSize(width:0,height:100*count)
        calculateFieldsRectange()
        for countItem in 0..<data.count{
            listButton = setupListButton(item: countItem)
            lblHeader = setupSelectedField()
            lblHeaderValue = setupSelectedFieldValue()
            buttons.append(listButton)
            scroll.addSubview(lblHeader)
            scroll.addSubview(lblHeaderValue)
            scroll.addSubview(buttons[countItem])
            self.addSubview(scroll)
        }

    }
    @objc func clickItem(sender:ListButton){
        lblHeaderValue.text=""
        lblHeaderValue.text = sender.titleLabel?.text
    }
}
