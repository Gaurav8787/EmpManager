//
//  AddViewController.swift
//  EmpManager
//
//  Created by Gaurav on 10/10/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit

enum emplType: Int {
    case typeEMP = 0
    case typeMANGR
}

class AddViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var mobno: UITextField!
    
    @IBOutlet weak var typePerson: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tyPersonClicked(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func btnSaveClicked(_ sender: UIButton) {
        
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if typePerson.selectedSegmentIndex == emplType.typeEMP.rawValue {
            
            let emp = Employee(context:context)
            
            emp.name = name.text
            emp.mobnum = Int16(truncating: NSNumber(value: Int16(mobno.text!)!))
            
        } else {
            
            let man = Manager(context: context)
            man.name = name.text
            man.mobno = Int16(truncating: NSNumber(value: Int16(mobno.text!)!))
            
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
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
