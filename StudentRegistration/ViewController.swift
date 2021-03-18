//
//  ViewController.swift
//  StudentRegistration
//
//  Created by SOMA SEKHAR ANAPARTHI on 17/03/21.
//

import UIKit
 
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedCourse: Course?
    var courseList = [Course]()
    var selectedList = [Course]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = courseList[indexPath.row]//the index of the selected row in the tableView
        let cell = courseTable.dequeueReusableCell(withIdentifier: "cell") as! courseTableCell
        cell.setCourseCell(course: course)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCourse = courseList[indexPath.row]
        checkCourseButton()
    }
    
    @IBOutlet weak var courseTable: UITableView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var addCourseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        message.text = "after Adding, click My Courses For Registration"
        
        courseTable.tableFooterView = UIView()
        
        courseTable.delegate = self
        courseTable.dataSource = self
        
        courseList.append(Course(name:"Java",hours: 5,fee: 1600.0))
        courseList.append(Course(name:"Python",hours: 4,fee: 1850.0))
        courseList.append(Course(name:"Database",hours: 3,fee: 1300.0))
        courseList.append(Course(name:"Web Development",hours: 4,fee: 1200.0))
        courseList.append(Course(name:"iOS Develeopment",hours: 5,fee: 2200.0))
        courseList.append(Course(name:"Android Development",hours: 5,fee: 2000.0))
        courseList.append(Course(name:"System Analysis",hours: 4,fee: 1900.0))
        courseList.append(Course(name:"Cloud Computing",hours: 3,fee: 1250.0))
        courseList.append(Course(name:"Machine Learning",hours: 5,fee: 2300.0))
        courseList.append(Course(name:"Problem Solving",hours: 3,fee: 950.0))
        
        checkCourseButton()
    }

    func checkCourseButton(){
        if selectedCourse == nil{
            addCourseButton.alpha = 0.5
            addCourseButton.isEnabled = false
        }else{
            addCourseButton.alpha = 1
            addCourseButton.isEnabled = true
        }
    }

    @IBAction func addCoursePressed(_ sender: Any){
        
        var inList = 0
        let courseAdded = selectedCourse?.name ?? "Course"
        for course in selectedList{
            if courseAdded == course.name{
                inList = 1
            }
        }
        
        if inList == 0{
            self.selectedList.append(selectedCourse!)
            message.textColor = #colorLiteral(red: 0.0455943197, green: 0.477083981, blue: 0.9989785552, alpha: 1)
            message.text = "\(courseAdded) Added to My Courses"
        }else{
            message.textColor = #colorLiteral(red: 0.8705882353, green: 0.1098039216, blue: 0.05098039216, alpha: 1)
            message.text = "\(courseAdded) Already Added to My Courses"
        }
        
    }
    
    @IBAction func myCoursesPressed(_ sender: Any){
        performSegue(withIdentifier: "registerSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? RegisterViewController
        destination?.selectedList = self.selectedList
    }


}

