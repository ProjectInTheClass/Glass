//
//  shoes.swift
//  crystal_shoes
//
//  Created by software_studio1 on 2018. 4. 19..
//  Copyright © 2018년 software_studio1. All rights reserved.
//

import Foundation


class Shoes{
    
    let title:String
    let shoestype:String
    let brand:Brand
    let size:[Int]
    let productnumber:String
    let color:[String]
//    let date:Date
    let target:[String]
    let price:Int
    let imageName:String
    init(title:String, shoestype:String, brand: Brand, size:[Int], productnumber: String, color:[String], /*date:Date,*/ target:[String], price:Int, imageName:String){
        self.title = title
        self.shoestype = shoestype
        self.brand = brand
        self.size = size
        self.productnumber = productnumber
        self.color = color
     //   self.date=date
        self.target=target
        self.price = price
        self.imageName = imageName
        
    }

};

class Brand{
    let name:String
    let shoestypes:[String]
//    var childbrand:[Brand]
    
    
    init(name:String, shoestypes:[String])
    {
        self.name = name
        self.shoestypes = shoestypes
   
        //self.childbrand = childbrand
    }
    
};



func createDummy() -> [Shoes]{
    

    let addidas = Brand(name:"addidas", shoestypes:["running","originals", "outdoor", "training", "tennis", "swim", "golf"])
    
    let superstar = Shoes(title:"superstar" , shoestype:"running", brand:addidas, size:[230,240,250,260], productnumber:"C77124", color:["white" ,"black"], target:["F","M"], price:109000, imageName:"1");

    let baricadeclub = Shoes(title:"baricadeclub" , shoestype:"tennis", brand:addidas, size:[230,240,250,260], productnumber:"CM7768", color:["white" ,"navy"],target:["F"], price:109000, imageName: "2");

    let addizeroubersonic3 = Shoes(title:"아디제로우버소닉3" , shoestype:"tennis", brand:addidas, size:[230,240,250,260], productnumber:"CM7751", color:["yellow" ,"orange"],  target:["F"], price:149000, imageName: "3");

    let STELLAMCCARTNEY = Shoes(title:"스텔라 바리케이드 부스트" , shoestype:"tennis", brand:addidas, size:[225,230,235,240,245,250,255], productnumber:"CM7804", color:["yellow"], target:["F"], price:189000, imageName: "4");
    
    let CFadilet = Shoes(title:"CFAdilet" , shoestype:"swim", brand:addidas, size:[235,245,255,265], productnumber:"AQ1702", color:["white" ,"black"], target:["M"], price:35000, imageName: "5");
    
    let aqualet = Shoes(title:"aqualet" , shoestype:"swim", brand:addidas, size:[235,245,255,265], productnumber:"CM7930", color:["white" , "grey"], target:["M"], price:35000, imageName: "6");
    
    let trainPro = Shoes(title:"트레인 프로" , shoestype:"training", brand:addidas, size:[230,240,250], productnumber:"BB6240", color:["navy" ,"white"], target:["F","M", "K"], price:229000, imageName: "7");
    
    let pureBoost = Shoes(title:"퓨어부스트 트레이닝3.0" , shoestype:"training", brand:addidas, size:[230,240,250,260], productnumber:"CG3529", color:["white" ,"silver"], target:["F","M", "K"], price:229000, imageName: "8");
    
    let adipower = Shoes(title:"아디파워 부스트 보아" , shoestype:"golf", brand:addidas, size:[230,240,250], productnumber:"DA9111", color:["green" ,"white"], target:["F"], price:260000, imageName: "9");

    return[superstar,baricadeclub,addizeroubersonic3,STELLAMCCARTNEY,CFadilet,aqualet,trainPro,pureBoost,adipower]

}

let shoes_1:[Shoes] = createDummy();

