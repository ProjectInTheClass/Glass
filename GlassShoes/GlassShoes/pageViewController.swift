//
//  pageViewController.swift
//  GlassShoes
//
//  Created by 김예지 on 2018. 6. 10..
//  Copyright © 2018년 software_studio1_예림. All rights reserved.
//

import UIKit

class pageViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    var images = ["glass_shoes.jpeg", "glass_shoes2.jpeg", "last.png"]
    var texts = ["아", "야", "어"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        imageView.image = UIImage(named:images[0])
        textView.text = texts[0]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pageChanged(_ sender: Any) {
        if pageControl.currentPage == 2 {
            let appDelegate = UIApplication.shared.delegate!
            appDelegate.window!?.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "intro")
        }
        imageView.image = UIImage(named:images[pageControl.currentPage])
        textView.text = texts[pageControl.currentPage]
        
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
