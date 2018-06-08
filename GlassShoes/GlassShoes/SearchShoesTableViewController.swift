//
//  SearchShoesTableViewController.swift
//  GlassShoes
//
//  Created by software_studio1 on 2018. 6. 3..
//  Copyright © 2018년 software_studio1_예림. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SearchShoesTableViewController: UITableViewController, UISearchResultsUpdating {
    
    @IBOutlet var Searchtableview: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    var ref = Database.database().reference()
    var ShoesList = [NSDictionary?]()
    var filteredShoes = [NSDictionary?]()
    
    @IBAction func changesize(_ sender: Any) {
        let setting = UserDefaults.standard
        _ = setting.integer(forKey: "size")
        let sizeVC = self.storyboard?.instantiateViewController(withIdentifier: "sizeViewController")
        self.present(sizeVC!, animated: true, completion: nil)
    }
    
    
    @IBAction func openWrite(_ sender: Any) {
        
        let writeVC = self.storyboard?.instantiateViewController(withIdentifier: "dataWriteScene")
        self.present(writeVC!, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        ref.child("Shoes").queryOrdered(byChild: "brand").observe(.childAdded, with:{ (snapshot) in
            
            self.ShoesList.append(snapshot.value as? NSDictionary)
            
            //insert the rows
            self.Searchtableview.insertRows(at: [IndexPath(row:self.ShoesList.count-1, section : 0)], with: UITableViewRowAnimation.automatic)
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        let setting = UserDefaults.standard
        let size = setting.integer(forKey: "size")
        if size == 0 {
            let sizeVC = self.storyboard?.instantiateViewController(withIdentifier: "sizeViewController")
            self.present(sizeVC!, animated: true, completion: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if searchController.isActive && searchController.searchBar.text != ""{
            return filteredShoes.count
        }
        
        return self.ShoesList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoesCell", for: indexPath)

        let shoes : NSDictionary?
        
        if searchController.isActive && searchController.searchBar.text !=
            ""{
            shoes = filteredShoes[indexPath.row]
        }
        else
        {
            shoes = self.ShoesList[indexPath.row]
        }
        cell.textLabel?.text = shoes?["name"] as? String
        cell.detailTextLabel?.text = shoes?["brand"] as? String
       
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailSegue", let indexPath = self.tableView.indexPathForSelectedRow, let nextVC = segue.destination as? selectedViewController {
                let selectedData : NSDictionary?
                if searchController.isActive && searchController.searchBar.text != ""{
                    selectedData = filteredShoes[indexPath.row]
                    nextVC.selectedShoes = selectedData
                }
                else
                {
                    selectedData = self.ShoesList[indexPath.row]
                    nextVC.selectedShoes = selectedData
                }
        }
        else if segue.identifier == "writeSegue"{
            if let nextVC2 = segue.destination as? dataWriteViewController {
                    nextVC2.ShoesCount = ShoesList.count
            }
        }
        /*if let indexPath = self.tableView.indexPathForSelectedRow,
            let nextVC = segue.destination as? selectedViewController {
                let selectedData : NSDictionary?
                if searchController.isActive && searchController.searchBar.text != ""{
                    selectedData = filteredShoes[indexPath.row]
                    nextVC.selectedShoes = selectedData
                }
                else
                {
                    selectedData = self.ShoesList[indexPath.row]
                    nextVC.selectedShoes = selectedData
                }
        }*/
        
    }
    
    
    func updateSearchResults(for searchController: UISearchController){
     
        //검색결과 업데이트
        filterContent(searchText: self.searchController.searchBar.text!)
        
    }
    
    func filterContent(searchText:String)
    {
        self.filteredShoes = self.ShoesList.filter{shoes in
         
        let shoesname = shoes?["name"] as? String
        let brandname = shoes?["brand"] as? String
          
            return((shoesname?.lowercased().contains(searchText.lowercased()))!||(brandname?.lowercased().contains(searchText.lowercased()))!)
        }
        
        tableView.reloadData()
    }

}
