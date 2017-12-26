//
//  EmplyeeListViewController.swift
//  EmpManager
//
//  Created by Gaurav on 10/10/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit
import CoreData

class EmplyeeListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var empltable: UITableView!
    
      var myManager:Manager?
    var emplList = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
            let predicate = NSPredicate(format: "manager == nil || manager != %@", myManager!)
            fr.predicate = predicate
            
            emplList = try context.fetch(fr) as! [Employee]
            
            print(emplList)
            
        } catch {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emplList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let empl = emplList[indexPath.row]
        cell.textLabel?.text = empl.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let empl = emplList[indexPath.row]
        self.myManager?.addToEmployees(empl)
        
        self.navigationController?.popViewController(animated: true)
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
