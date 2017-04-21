//
//  DetailViewController.swift
//  ActorsTest
//
//  Created by mvalbuquerque on 18/04/17.
//  Copyright © 2017 br.com.appfagronglobal.fate. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    //current controller IBOutlets
//    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var dobLabel: UILabel!
    //Esse
    @IBOutlet weak var countryLabel: UILabel!
   
    @IBOutlet weak var descripLabel: UILabel!
    
    //data from previous controller
    var countrySring: String!
    var nameString: String!
    var descriString: String!
    var imgString: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateUI() {
        
        self.countryLabel.text = countrySring
        self.nameLabel.text = nameString
        self.descripLabel.text = descriString
       
    
        let imgURL = URL (string: imgString)
        if imgURL != nil {
            let data = NSData(contentsOf: (imgURL as URL?)!)
            
        self.imageView.image = UIImage(data: data! as Data)
        
        }
        
      //let imgURL = URL(string:imageString)
      //
      //let data = NSData(contentsOf: (imgURL)!)
      //self.imageView.image = UIImage(data: data! as Data)
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
