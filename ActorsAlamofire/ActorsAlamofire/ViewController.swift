//
//  ViewController.swift
//  ActorsAlamofire
//
//  Created by mvalbuquerque on 21/04/17.
//  Copyright © 2017 br.com.mvalbuquerque.actorsalamofire. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Objeto que define a TableView
    @IBOutlet weak var tableView: UITableView!
    
    // Definindo as variáveis
    var actorArray = [AnyObject]()
//    var name = [AnyObject]()
//    var country = [AnyObject]()
//    var descri = [AnyObject]()
//    var image = [AnyObject]()
//    var dob = [AnyObject]()
    //    var dob = [AnyObject]()
    //    var height = [AnyObject]()
       var spouse = [AnyObject]()
    //    var children = [AnyObject]()
    //    var image = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("http://localhost:8080/actors").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
           if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                    if  let dict = json as? [[String: Any]] {
                        self.actorArray = dict as [AnyObject]
                        self.tableView.reloadData()
            }
    }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorArray.count
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?
        CustomTableViewCell
        
        
        //Key do objeto de retorno do Json
        let name = actorArray[indexPath.row]["name"]
        let country = actorArray[indexPath.row]["country"]
        let descri = actorArray[indexPath.row]["description"]
        let image = actorArray[indexPath.row]["img"]
        let  dob = actorArray[indexPath.row]["dob"]
        
        
        //Todo:
        //      let dob = actorArray[indexPath.row]["dob"]
        //      let height = actorArray[indexPath.row]["height"]
        //      let spouse = actorArray[indexPath.row]["spouse"]
        //      let children = actorArray[indexPath.row]["children"]
        //      let image = actorArray[indexPath.row]["image"]
        
        //Retorno da label
        cell?.name.text = name as? String
        cell?.country.text = country as? String
        cell?.descri.text = descri as? String
        cell?.dob.text = dob as? String
     
        
        
        //Transformando a URL da imagem em Imagem
        let imgURL = URL (string: image as! String)
        if imgURL != nil {
            let foto = NSData(contentsOf: (imgURL as URL?)!)
            cell?.photo.image = UIImage(data: foto! as Data)

            
        }
        
        return cell!
        
    }
    
    
    
    ///for showing next detailed screen with the downloaded info
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        //Enviando as informações para outra tela
        vc.countrySring = actorArray[indexPath.row]["country"] as! String
        vc.nameString = actorArray[indexPath.row]["name"] as! String
        vc.descriString = actorArray[indexPath.row]["description"] as! String
        vc.imgString = actorArray[indexPath.row]["img"] as! String
        vc.dobString = actorArray[indexPath.row]["dob"] as! String
        
        //Abrindo a outra tela em forma de navigation
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        //Abrindo como um modal
        //self.present(vc, animated: true, completion: nil)
        
        
        
    }
    

}


