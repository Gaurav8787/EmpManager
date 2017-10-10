//
//  ManagerDetailsViewController.swift
//  EmpManager
//
//  Created by Gaurav on 10/10/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit

class ManagerDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var managerTable: UITableView!
    var myManager:Manager?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        managerTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.myManager?.employees?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let empl = myManager?.employees?.allObjects[indexPath.row] as! Employee
        cell.textLabel?.text = empl.name
        
        return cell
    }

    
    @IBAction func pluspressed(_ sender: UIButton) {
         self.performSegue(withIdentifier: "showEmpl", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEmpl" {
                let vc = segue.destination as! EmplyeeListViewController
                
                vc.myManager = self.myManager

        }
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
