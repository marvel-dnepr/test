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
    var someArray : [Int] = [0]
    var root : ViewController!            //Объявляю переменную для хранения адреса родительского контроллера
    static var count = 0
    static var totalWindow = 0
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
        ViewController.count -= 1
        
        // Обращаюсь к родительскому ViewController, который находится в переменной root (на момент обращения, она уже будет не пустая), и прошу его закрыть созданный им ViewController
        
        root.dismiss(animated: true, completion: nil)
        
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
        
        let controller : ViewController = storyboard!.instantiateViewController(withIdentifier: "someViewController") as! ViewController
        
        // Обращаюсь к родительскому ViewController и прошу отобразить созданный им новый ViewController
        
        self.present(controller, animated: true, completion: nil)
        
        // записываю адрес родительского View Controller в переменную root
        
        controller.root = self
        
        }
    func hideAll() {
        buttonBackClick.isHidden = true
        buttonClick.isHidden = true
        buttonSum.isHidden = true
        buttonZero.isHidden = true
        buttonClose.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.count += 1
        ViewController.totalWindow += 1
        if ViewController.count > 1  {
            view.backgroundColor = UIColor.init(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if ViewController.count > 1  {
            hideAll() //Скрываю ненужные элементы на новом ViewController перед тем как он отобразится
        }
        totalOpenedWindow.text = "Total opened screen - \(ViewController.totalWindow)"
        countWindow.text = "Screen № \(ViewController.count)"
    }
}


