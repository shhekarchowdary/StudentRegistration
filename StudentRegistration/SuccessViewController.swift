//
//  SuccessViewController.swift
//  StudentRegistration
//
//  Created by SOMA SEKHAR ANAPARTHI on 18/03/21.
//

import UIKit

class SuccessViewController: UIViewController {
    
    var rmessage: String = ""
    var hours: String = ""
    var fee: String = ""

    @IBOutlet weak var message:UILabel!
    @IBOutlet weak var totalHours:UILabel!
    @IBOutlet weak var totalFee:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        message.text = "Student Registration Succesfull"
        totalHours.text = "Total Hours:" + hours
        totalFee.text = "Total Fee: " + fee
    }
    
    @IBAction func srPressed(_ sender: Any){
        performSegue(withIdentifier:"homeSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeSegue" {
            let destination = segue.destination as? ViewController
            destination?.selectedList.removeAll()
        }
    }

}
