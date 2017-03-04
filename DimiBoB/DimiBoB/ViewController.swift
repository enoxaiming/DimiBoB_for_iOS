//
//  ViewController.swift
//  DimiBoB
//
//  Created by 하준혁 on 25/02/2017.
//  Copyright © 2017 HaJunHyeok. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var textField: UITextField!
    var names:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let url=URL(string:"http://dimigo.in/pages/dimibob_getdata.php?d=2016-03-30")
        do {
            let allContactsData = try Data(contentsOf: url!)
            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrJSON = allContacts["contacts"] {
                for index in 0...arrJSON.count-1 {
                    let aObject = arrJSON[index] as! [String : AnyObject]
                    names.append(aObject["date"] as! String)
                    //contacts.append(aObject["email"] as! String)
                }
            }
            print(names)
            
            text.text=names
            
            //print(contacts)
            
            //self.tableView.reloadData()
        }
        catch {
        }
        */
        
        let url = URL(string: "http://dimigo.in/pages/dimibob_getdata.php?d=2016-03-30")
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    
                    
                    OperationQueue.main.addOperation({
                        //self.tableView.reloadData()
                        print(json)
                        })
                    let breakfast = json["breakfast"] as? [String]
                    print(breakfast)
                    
                }catch let error as NSError{
                    print(error)
                }
            }
        }).resume()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

