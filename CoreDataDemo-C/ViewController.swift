//
//  ViewController.swift
//  CoreDataDemo-C
//
//  Created by Rui Geng on 2016-10-13.
//  Copyright © 2016 Rui Geng. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addProduct(name: "iPhone 6s 16GB", price: 24500)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // get the managed object context that allows to use core data.
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    // Save Data Function
    func addProduct(name:String, price:Double) {
        let context = getContext()

        //retrieve the entity that just created
        let entity =  NSEntityDescription.entity(forEntityName: "Product", in: context)
        
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        transc.setValue(name, forKey: "name")
        transc.setValue(price, forKey: "price")
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }

    }

}

