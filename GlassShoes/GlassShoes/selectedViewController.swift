//
//  selectedViewController.swift
//  GlassShoes
//
//  Created by 정민 on 2018. 6. 4..
//  Copyright © 2018년 software_studio1_예림. All rights reserved.
//

import UIKit
import FirebaseStorage
import SafariServices

class selectedViewController: UIViewController {
    @IBOutlet weak var selShoImage: UIImageView!
    @IBOutlet weak var selShoBrand: UILabel!
    @IBOutlet weak var selShoName: UILabel!
    @IBOutlet weak var selShoPnum: UILabel!
    @IBOutlet weak var selShoGender: UILabel!
    @IBOutlet weak var selShoPrice: UILabel!
    @IBOutlet weak var recommendedSize: UILabel!
    
    @IBAction func gotoWeb(_ sender: Any) {
        
        let searchUrl:String = "http://www.abcmart.co.kr/abc/search/search?searchTerm="
      /*  let forSearchBrand:String = selectedShoes?["brand"] as! String
        let forSearchNum:String = selectedShoes?["product_num"] as! String
        
        let sumUrl = searchUrl + forSearchBrand+forSearchNum
        print(sumUrl)
        */
        guard let url = URL(string: searchUrl ) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        
        present(safariViewController, animated: true, completion: nil)
        

    }
    
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
            recommendedSize.text = "내 신발 사이즈 : \(size) \n 추천 사이즈 : \(size + sizeRange)mm"
        }
        selShoBrand.text = selectedShoes?["brand"] as? String
        selShoName.text = selectedShoes?["name"] as? String
        selShoPnum.text = selectedShoes?["product_num"] as? String
        selShoGender.text = selectedShoes?["gender"] as? String
        if let price = selectedShoes?["price"] as? Int {
            selShoPrice.text = String(price)
        }
        
        //이미지 url처리
        let urlStr = selectedShoes?["url"] as? String
        if let url = URL(string: (urlStr)!),
            let data = try? Data(contentsOf: url) {
            let image = UIImage(data: data)
            selShoImage.image = image
        }
        
      
        
    }

}
