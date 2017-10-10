//
//  ListManagersViewController.swift
//  EmpManager
//
//  Created by Gaurav on 10/10/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit

class ListManagersViewController: UIViewController,passingData {
  
  
    @IBOutlet weak var mytableview: MyTableViewController!
    
    var managers = [Manager]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mytableview.del = self
        mytableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view.
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            managers = try context.fetch(Manager.fetchRequest())
            print(managers)
            mytableview.managers = self.managers
            mytableview.reloadData()
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return managers.count;
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        let managerO = managers[indexPath.row]
//        cell.textLabel?.text = managerO.name
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMandetails" {
            if let selectedINPath = self.mytableview.indexPathForSelectedRow {
                let man = self.managers[selectedINPath.row]
                
                let vc = segue.destination as! ManagerDetailsViewController
                    
                    vc.myManager = man

            }
        }
    }
    
    func finishPassing(string:String) {
        print(string)
           self.performSegue(withIdentifier: "showMandetails", sender: self)
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
