//
//  RegisterViewController.swift
//  StudentRegistration
//
//  Created by SOMA SEKHAR ANAPARTHI on 18/03/21.
//

import UIKit


class RegisterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    var selectedList = [Course]()
    var selectedCourse: Course?
    var previousViewController: UIViewController?
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = selectedList[indexPath.row]//the index of the selected row in the tableView
        let cell = course2Table.dequeueReusableCell(withIdentifier: "cell") as! course2TableCell
        cell.setCourseCell(course: course)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCourse = selectedList[indexPath.row]
        checkRemoveButton()
    }
    
    
    @IBOutlet weak var course2Table: UITableView!
    @IBOutlet weak var totalhours: UILabel!
    @IBOutlet weak var totalFee: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    var tHours: Int = 0
    var tFee: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        message.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        message.text = "Check Courses and do Register"
        
        course2Table.tableFooterView = UIView()
        
        course2Table.delegate = self
        course2Table.dataSource = self
        
        total()
        checkRemoveButton()
        checkRegisterButton()
    }
    
    
    
    func total(){
        tHours = 0
        tFee = 0.0
        for course in selectedList{
            tHours += course.hours
            tFee += course.fee
        }
        totalhours.text = String(tHours)
        totalFee.text = String(tFee)
        
        if tHours > 19 {
            message.textColor = #colorLiteral(red: 0.8705882353, green: 0.1098039216, blue: 0.05098039216, alpha: 1)
            message.text = "Total Hours Must not be > 19 Remove some course"
        }
    }
    
    func checkRemoveButton(){
        if selectedList.isEmpty{
            removeButton.isEnabled = false
        }else if selectedCourse == nil{
            removeButton.isEnabled = false
        }else{
            removeButton.isEnabled = true
        }
    }
    
    func checkRegisterButton(){
        if selectedList.isEmpty{
            message.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            message.text = "Please add atleast one course to Register"
            registerButton.alpha = 0.5
            registerButton.isEnabled = false
        }else if tHours <= 19 && tHours > 0 {
            registerButton.alpha = 1
            registerButton.isEnabled = true
        }else{
            message.textColor = #colorLiteral(red: 0.8705882353, green: 0.1098039216, blue: 0.05098039216, alpha: 1)
            message.text = "Total Hours Must not be > 19 Remove some course"
            registerButton.alpha = 0.5
            registerButton.isEnabled = false
        }
    }
    
    @IBAction func removeCoursePressed(_ sender: Any){
        var removeIndex = 0
        let removeCourse = selectedCourse?.name ?? "course"
        for index in 0..<selectedList.count {
            if(removeCourse == selectedList[index].name) {
                removeIndex = index
            }
        }
        selectedList.remove(at: removeIndex)
        total()
        self.selectedCourse = nil
        checkRemoveButton()
        course2Table.reloadData()
        checkRegisterButton()
        
    }
    
    @IBAction func registerPressed(_ sender: Any){
            performSegue(withIdentifier:"registerSegue", sender: self)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier:"backSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backSegue" {
            let destination = segue.destination as? ViewController
            destination?.selectedList = self.selectedList
        }
        if segue.identifier == "registerSegue" {
            let destination = segue.destination as? SuccessViewController
            destination?.hours = totalhours.text!
            destination?.fee = totalFee.text!
        }
    }

}
