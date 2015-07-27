//
//  ViewController.swift
//  Masu
//
//  Created by midnightSuyama on 07/27/2015.
//  Copyright (c) 2015 midnightSuyama. All rights reserved.
//

import UIKit
import Masu

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // UIView demo
        let masu = Masu(frame: CGRectMake(0, 300, 220, 100))
        masu.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0.5, alpha: 1)
        masu.text            = "View"
        self.view.addSubview(masu)
        
        // UIImage demo
        let btn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        btn.frame = CGRectMake(220, 300, 100, 100)
        btn.setImage(Masu.imageWithSize(btn.frame.size, backgroundColor: UIColor.grayColor(), labelText: "Button"), forState: UIControlState.Normal)
        self.view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

