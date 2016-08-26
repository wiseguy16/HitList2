//
//  HitListTableViewController.swift
//  HitList2
//
//  Created by Gregory Weiss on 8/25/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit
import CoreData

class HitListTableViewController: UITableViewController {
    
   // var names = [String]()
    var people = [NSManagedObject]()
    var myFormatter = NSDateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The Gallery"
        myFormatter.dateStyle = .NoStyle
        myFormatter.timeStyle = .MediumStyle

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            people = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return names.count
        return people.count
    }
    
  
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HitListTableViewCell", forIndexPath: indexPath) as! HitListTableViewCell

        // Configure the cell...
        let person = people[indexPath.row]
        cell.nameLabel.text = person.valueForKey("name") as? String
        
        let timeToShow = person.valueForKey("theDate") as? NSDate
//        let convertedTime = NSDate(timeIntervalSince1970: timeToShow!)
        let formattedTime = myFormatter.stringFromDate(timeToShow!)
        cell.DateLabel.text = formattedTime
        
        

        //let thisImage: UIImage = UIImage(data: person.valueForKey("theImage")
        let myData = person.valueForKey("theImage") as! NSData
        let myImage = UIImage(data: myData)
        
        cell.pictView.image = myImage

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
//    
//    {
//        if segue.identifier == "GoModalSegue"
//        {
//        let drawingVc = segue.destinationViewController as! DrawingViewController
//            self.presentViewController(drawingVc, animated: true, completion: nil)
//            //drawingVc.presentViewController(DrawingViewController, animated: true, completion: nil)
//           // drawingVc.transitioningDelegate = self
//            
//        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//    }
    
    @IBAction func gotoModalTapped(sender: UIBarButtonItem)
    {
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("DrawingModalVC")
        self.showViewController(vc as! DrawingViewController, sender: vc)
        
    }
    
 
    
    @IBAction func addName(sender: UIBarButtonItem)
    {
//        let alert = UIAlertController(title: "Save Drawing", message: "Add a new name", preferredStyle: .Alert)
//        
//        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: {
//            (action:UIAlertAction) -> Void in
//                                        let textField = alert.textFields!.first
//                                        self.saveName(textField!.text!)
//                                        self.tableView.reloadData()
//        })
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) {
//            (action: UIAlertAction) -> Void in
//        }
//        
//        alert.addTextFieldWithConfigurationHandler {
//            (textField: UITextField) -> Void in
//        }
//        
//        alert.addAction(saveAction)
//        alert.addAction(cancelAction)
//        
//        presentViewController(alert, animated: true, completion: nil)
    }
    
//    func saveName(name: String)
//    {
//        //1
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        //2
//        let entity =  NSEntityDescription.entityForName("Person", inManagedObjectContext:managedContext)
//        
//        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
//        
//        //3
//        person.setValue(name, forKey: "name")
//    
//        
//        let currentDate = NSDate()
//       // let thisIsTheTime = myFormatter.stringFromDate(currentDate)
//        person.setValue(currentDate, forKey: "theDate")
//        
//        
//        let imageData = UIImagePNGRepresentation(makeImage())
//        person.setValue(imageData, forKey: "theImage")
//        
//        //4
//        do {
//            try managedContext.save()
//            //5
//            people.append(person)
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
//    }
//    
//    func makeImage() -> UIImage
//    {
//        UIGraphicsBeginImageContext(self.view.bounds.size)
//        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
//        let viewImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return viewImage
//    }

    
    
    
        @IBAction func deleteLastPerson(sender: UIBarButtonItem)
    {
        
        deleteName()
        tableView.reloadData()
        
    }
    
    func deleteName()
    {
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
       // managedContext.deleteObject(people.last!)
        

        //4
        do {
            //people.
            try managedContext.save()
            //5
            people.removeLast()
            managedContext.deleteObject(people.last!)
           // people.removeLast()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        tableView.reloadData()
    }

    
    
    


}






