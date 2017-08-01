//
//  ViewController.swift
//  CountdownButtonDemo
//
//  Created by doluvor on 2017/8/1.
//  Copyright © 2017年 doluvor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonHandler(_ sender: CountdownButton) {
        
        sender.cd_startCountdown(startCount: 10) {
            
            sender.isEnabled = true
        }
    }
}

