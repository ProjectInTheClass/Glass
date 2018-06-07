//
//  introViewController.swift
//  GlassShoes
//
//  Created by 김예지 on 2018. 6. 4..
//  Copyright © 2018년 software_studio1_예림. All rights reserved.
//

import UIKit

class introViewController: UIViewController {

    @IBOutlet weak var start: UIButton!
    
    @IBAction func clickto(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate!
        appDelegate.window!?.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainScene")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
