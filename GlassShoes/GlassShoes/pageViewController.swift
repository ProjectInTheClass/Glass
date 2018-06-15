//
//  pageViewController.swift
//  GlassShoes
//
//  Created by 김예지 on 2018. 6. 10..
//  Copyright © 2018년 software_studio1_예림. All rights reserved.
//

import UIKit

class pageViewController: UIViewController {

    @IBOutlet weak var textView2: UILabel!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    var images = ["glass_shoes.jpeg", "scene3.png"]
    var texts = ["온라인으로 신발을 살때 이 신발이 정사이즈로 나왔는지, 아니면 좀더 크게 나왔는지 알지 못해 고민되셨던 적이 있나요?", "이제 더 이상 걱정하지 마세요."]
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        imageView.image = UIImage(named:images[0])
        textView2.text = texts[0]
        //imageView.layer.cornerRadius = imageView.frame.size.height / 2
        //imageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 타이머를 이용해서 자동 페이지 이동
        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) { (timer) in
            if self.pageControl.currentPage == 1 {
                timer.invalidate()
                
                let appDelegate = UIApplication.shared.delegate!
                appDelegate.window!?.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "intro")
            }
            else {
                self.pageControl.currentPage += 1
                self.imageView.image = UIImage(named: self.images[self.pageControl.currentPage])
                self.textView2.text = self.texts[self.pageControl.currentPage]
            }
        }
    }
    
    @IBAction func pageChanged(_ sender: Any) {
//        if pageControl.currentPage == 2 {
//            let appDelegate = UIApplication.shared.delegate!
//            appDelegate.window!?.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "intro")
//        }
        
        
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
