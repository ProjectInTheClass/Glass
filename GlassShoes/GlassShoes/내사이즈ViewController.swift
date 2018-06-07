//
//  내사이즈ViewController.swift
//  GlassShoes
//
//  Created by 김예지 on 2018. 6. 3..
//  Copyright © 2018년 software_studio1_예림. All rights reserved.
//

import UIKit

class ________ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var myimage: UIImageView!
    
    @IBAction func okay(_ sender: Any) {
        let setting = UserDefaults.standard
        let size = Int(Array[selectRow])
        setting.set(size, forKey: "size")
        setting.synchronize()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var circle1: UIView!
  
    var selectRow = 0
    var Array = ["200", "205", "210", "215", "220", "225", "230", "235", "240", "245", "250", "255", "260", "270", "275", "280", "285", "290", "295"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component:Int) -> String? {
        return Array[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row:Int, inComponent component: Int){
        selectRow = row
    }

  
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circle1.layer.cornerRadius = 0.5 * circle1.bounds.size.width
        circle1.alpha = 0.5
        myimage.alpha = 0.4
        picker.delegate = self
        picker.dataSource = self

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
