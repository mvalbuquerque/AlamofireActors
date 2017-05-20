//
//  CustomTableViewCell.swift
//  ActorsTest
//
//  Created by mvalbuquerque on 17/04/17.
//  Copyright © 2017 br.com.appfagronglobal.fate. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    //Objeto que define o retorno da label titulo
      @IBOutlet weak var name: UILabel!
      @IBOutlet weak var country: UILabel!
      @IBOutlet weak var descri: UILabel!
      @IBOutlet weak var imgViewHome: UIImageView!
      @IBOutlet weak var dob: UILabel!
    
    //Todo:
    
    //  @IBOutlet weak var dob: UILabel!
    //  @IBOutlet weak var height: UILabel!
    //  @IBOutlet weak var spouse: UILabel!
    //  @IBOutlet weak var children: UILabel!
    // @IBOutlet weak var imgViewHome: UIImageView!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
