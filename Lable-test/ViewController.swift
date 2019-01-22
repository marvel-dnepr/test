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
    static var totalWindow = 1
    var someArray : [Int] = [0]
    var link : ViewController!
    @IBOutlet weak var countWindow : UILabel!
    @IBOutlet weak var clickCheck : UILabel!
    @IBOutlet weak var viewSum : UILabel!
    @IBOutlet weak var buttonSum: UIButton!
    @IBOutlet weak var buttonBackClick: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonClick: UIButton!
    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var totalOpenedWindow: UILabel!
    @IBAction func closeWindow(_ sender: UIButton) {
        link.dismiss(animated: true, completion: nil)
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
        ViewController.totalWindow += 1
        let nextView = newViewController()
        self.present(nextView, animated: true, completion: nil)
        nextView.buttonBackClick.isHidden = true
        nextView.buttonClick.isHidden = true
        nextView.buttonSum.isHidden = true
        nextView.buttonZero.isHidden = true
        nextView.buttonClose.isHidden = false
        nextView.countWindow.text = "Screen № \(ViewController.count)"
        nextView.totalOpenedWindow.text = "Total opened screen - \(ViewController.totalWindow)"
        link = nextView
    }
    func newViewController () -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller : ViewController = storyboard.instantiateViewController(withIdentifier: "someViewController") as! ViewController
        return controller
    }
}


