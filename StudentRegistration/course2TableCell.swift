//
//  course2TableCell.swift
//  StudentRegistration
//
//  Created by SOMA SEKHAR ANAPARTHI on 18/03/21.
//

import UIKit

class course2TableCell: UITableViewCell {

    @IBOutlet weak var couresName:UILabel!
    @IBOutlet weak var hours:UILabel!
    @IBOutlet weak var fee:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCourseCell (course: Course){
        couresName.text = course.name
        hours.text = String(course.hours)
        fee.text = String(course.fee)
        
    }

}
