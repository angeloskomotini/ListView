//
//  ViewController.swift
//  ListView
//
//  Created by Angelos Staboulis on 31/12/19.
//  Copyright © 2019 Angelos Staboulis. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var list: ListView!
    
    var values = ListButton()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupView()
    }

}

extension ViewController{
    func setupView(){
          list.data.append("1")
          list.data.append("2")
          list.data.append("3")
          list.data.append("4")
          list.data.append("5")
          list.data.append("6")
          list.data.append("7")
          list.data.append("8")
          list.data.append("9")
          list.data.append("10")
          list.createList()
    }
   
}
