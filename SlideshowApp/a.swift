//
//  ViewController.swift
//  SlideshowApp
//
//  Created by USER on 2017/12/17.
//  Copyright © 2017年 片岡陸. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var ssbutton: UIButton!
    @IBOutlet weak var imageview: UIImageView!
    
    @IBAction func backpage(segue: UIStoryboardSegue){}
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        let ResultViewController:resultViewController = segue.destination as! resultViewController
        ResultViewController.nextimage = imageview.image
    }
    
    @IBOutlet weak var nbutton: UIButton!
    
    @IBOutlet weak var bbutton: UIButton!
    
    @IBAction func onTapImage(_ sender: AnyObject) {
        performSegue(withIdentifier: "result", sender: nil)
        self.timer?.invalidate()
        ssbutton.setTitle("再生", for: .normal)
    }
    
    var timer: Timer?
    var dispImageNo = 0
    func displayImage() {
        let imageNameArray = ["IMG_5499.PNG","IMG_5500.PNG","IMG_5501.PNG","IMG_5509.PNG","IMG_5504.PNG"]
        if dispImageNo < 0 {
            dispImageNo = 4
        }//elseをつけなくていいのは条件が重なっていないから。
        if dispImageNo > 4 {
            dispImageNo = 0
        }
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        imageview.image = image
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "IMG_5499.PNG")
        imageview.image = image
        
    }
    func onTimer(timer: Timer) {
        dispImageNo += 1
        displayImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextbutton(_ sender: AnyObject) {
       dispImageNo += 1
        displayImage()
        }
    
    
    @IBAction func backbutton(_ sender: AnyObject) {
        dispImageNo -= 1
        displayImage()
    }

    
    @IBAction func startstopbutton(_ sender: AnyObject) {
        if self.timer == nil {timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        ssbutton.setTitle("停止", for: .normal)
        nbutton.isEnabled = false
        bbutton.isEnabled = false}//#selecterはメソッドを呼べる
        else if self.timer != nil {
            self.timer?.invalidate()
            self.timer = nil
            ssbutton.setTitle("再生", for: .normal)
            nbutton.isEnabled = true
            bbutton.isEnabled = true
            
            
        }
        
    }


}


