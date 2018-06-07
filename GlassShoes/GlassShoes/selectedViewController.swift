//
//  selectedViewController.swift
//  GlassShoes
//
//  Created by 정민 on 2018. 6. 4..
//  Copyright © 2018년 software_studio1_예림. All rights reserved.
//

import UIKit
import FirebaseStorage

class selectedViewController: UIViewController {
    @IBOutlet weak var selShoImage: UIImageView!
    @IBOutlet weak var selShoBrand: UILabel!
    @IBOutlet weak var selShoName: UILabel!
    @IBOutlet weak var selShoPnum: UILabel!
    @IBOutlet weak var selShoGender: UILabel!
    @IBOutlet weak var selShoPrice: UILabel!
    @IBOutlet weak var recommendedSize: UILabel!
    
    
    var selectedShoes : NSDictionary?

    override func viewDidLoad() {
        super.viewDidLoad()

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
    override func viewWillAppear(_ animated: Bool) {
        

        if let selected = selectedShoes,
            let sizeRange = selected["size_range"] as? Int {
            let setting = UserDefaults.standard
            let size = setting.integer(forKey: "size")
            recommendedSize.text = "\(size + sizeRange)mm"
        }
        selShoBrand.text = selectedShoes?["brand"] as? String
        selShoName.text = selectedShoes?["name"] as? String
        selShoPnum.text = selectedShoes?["product_num"] as? String
        selShoGender.text = selectedShoes?["gender"] as? String
        if let price = selectedShoes?["price"] as? Int {
            selShoPrice.text = String(price)
        }
        
        let urlStr = "https://firebasestorage.googleapis.com/v0/b/glassshoes-1a0fc.appspot.com/o/%E1%84%80%E1%85%B3%E1%84%85%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%89%E1%85%B5%205.png?alt=media&token=7fb22444-cb1b-42c4-9937-8694ce8a3de1"
        if let url = URL(string: urlStr),
            let data = try? Data(contentsOf: url) {
            let image = UIImage(data: data)
            selShoImage.image = image
        }
        
    }

}
