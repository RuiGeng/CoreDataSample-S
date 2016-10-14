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
        self.showProducts()
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

    // Retrieve Data Function
    func showProducts() {
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //check the size of the returned results
            print ("num of results = \(searchResults.count)")
            
            //Convert to NSManagedObject to use 'for' loops
            for result in searchResults as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                print("Product Name: \(result.value(forKey: "name")), Price: \(result.value(forKey: "price"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
    }

}

