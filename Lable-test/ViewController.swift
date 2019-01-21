//
//  ViewController.swift
//  Lable-test
//
//  Created by Andrey on 22.12.2018.
//  Copyright © 2018 Andrey. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    var n = 0
    static var count = 1
    var someArray : [Int] = [0]
    @IBOutlet weak var countWindow : UILabel!
    @IBOutlet weak var clickCheck : UILabel!
    @IBOutlet weak var viewSum : UILabel!
    @IBOutlet weak var buttonSum: UIButton!
    @IBOutlet weak var buttonBackClick: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonClick: UIButton!
    @IBOutlet weak var buttonClose: UIButton!
    @IBAction func closeWindow(_ sender: UIButton) {
    }
    @IBAction func click() {
        n += 1
        updateTextField(n)
    }
    @IBAction func backClick() {
        n -= 1
        updateTextField(n)
    }
    @IBAction func toZero() {
        n = 0
        updateTextField(n)
    }
    func updateTextField(_:Int) {
        if n == 0 {
            clickCheck.textColor = UIColor.green
            } else if n%2 == 0 {
            clickCheck.textColor = UIColor.blue
            } else {
            clickCheck.textColor = UIColor.red
            }
        clickCheck.text = "\(n)"
        someArray.append(n)
    }
    @IBAction func sum() {
        var totalSum = 0
        for a in someArray[0...someArray.count-1] { totalSum += a }
        viewSum.text = "\(totalSum)"
    }
    @IBAction func newScreen(_ sender: UIButton) {
        ViewController.count += 1
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller : ViewController = storyboard.instantiateViewController(withIdentifier: "someViewController") as! ViewController
        self.present(controller, animated: true, completion: nil)
        controller.buttonBackClick.isHidden = true
        controller.buttonClick.isHidden = true
        controller.buttonSum.isHidden = true
        controller.buttonZero.isHidden = true
        controller.buttonClose.isHidden = false
        controller.countWindow.text = "Screen № \(ViewController.count)"
    }
}


