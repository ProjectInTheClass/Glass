//
//  dataWriteViewController.swift
//  GlassShoes
//
//  Created by software_studio1 on 2018. 6. 7..
//  Copyright © 2018년 software_studio1_예림. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class dataWriteViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
 
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var productnumTextField: UITextField!
    @IBOutlet weak var rangeField: UIPickerView!
    @IBOutlet weak var genderField: UISegmentedControl!
    @IBOutlet weak var priceField: UITextField!
    
    @IBOutlet weak var loadImageField: UIImageView!
    
    
    var Ref: DatabaseReference!
    let imagePicker = UIImagePickerController()
    var genderData:String = ""
    var ShoesCount : Int = 0
    
    @IBAction func canclaAdd(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func dbadd(_ sender: Any) {
        
        
       var data:[String: Any] = ["name" : "신발이름", "brand":"브랜드이름" , "product_num":"품번","gender": "공용", "price" : 10000, "size_range" :5,  ]
  

        data["name"] = nameTextField.text!
        data["brand"] = brandTextField.text!
        data["product_num"] = productnumTextField.text!
        data["gender"] = genderData
        data["size_range"] = Int(Array[selectRow])!
        data["price"] = Int(priceField.text!)
    
        let idxnum = ShoesCount
        let changeStr = "Shoes/" + String(idxnum)
        
        self.Ref = Database.database().reference()
        let itemRef = self.Ref.child(changeStr)
        itemRef.setValue(data)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    var selectRow = 0
    var Array = ["-20", "-15", "-10"," -5"," 0"," 5"," 10","15", "20"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return Array.count
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component:Int) -> String? {
        return Array[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row:Int, inComponent component: Int){
        selectRow = row
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String:AnyObject]){
       
        let imageData = info[UIImagePickerControllerEditedImage] as? UIImage
        loadImageField.image = imageData
        self.dismiss(animated: true, completion: nil)

/*        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            var imageData = Data()
            imageData = UIImageJPEGRepresentation(pickedImage, 0.8)!
            
            let imageRef = Storage.storage().reference().child("images/")
        
            _ = imageRef.putData(imageData, metadata: nil){(metadata, error) in
                guard let metadata = metadata else{
                return
            }
                let downloadURL = metadata.self
                print(downloadURL)
        
            }
        }*/
    }
    
    
    @IBAction func loadImage(_ sender: Any) {
        imagePicker.allowsEditing=true
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        
        rangeField.delegate = self
        rangeField.dataSource = self
        imagePicker.delegate = self
        
        genderField.selectedSegmentIndex = 0

        switch genderField.selectedSegmentIndex {
        case 0:
            genderData = "남성용"
        case 1:
            genderData = "여성용"
        case 2:
            genderData = "공용"
        default:
            ()
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(ShoesCount)
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
