//
//  DrawingCollectionViewController.swift
//  HitList2
//
//  Created by Gregory Weiss on 8/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "DrawingCell"

class DrawingCollectionViewController: UICollectionViewController
{
    
    var people = [NSManagedObject]()
    var myFormatter = NSDateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "The Gallery"
        myFormatter.dateStyle = .ShortStyle
        myFormatter.timeStyle = .NoStyle

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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
            people = results as! [Person]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        collectionView!.reloadData()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return people.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! DrawingCell
    
        // Configure the cell
        // Configure the cell...
        let person = people[indexPath.row] as! Person
        cell.nameLabel.text = person.name!
        
        let timeToShow = person.theDate!
        let formattedTime = myFormatter.stringFromDate(timeToShow)
        cell.dateLabel.text = formattedTime
        
        
        
//        let thisImage: UIImage = UIImage(data: person.valueForKey("theImage")
        let myData = person.valueForKey("theImage") as! NSData
        let myImage = UIImage(data: myData)
        
        cell.pictView.image = myImage

    
        return cell
    }

    @IBAction func addDrawingTapped(sender: UIBarButtonItem)
    {
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("DrawingModalVC")
        self.showViewController(vc as! DrawingViewController, sender: vc)
        
    }
    
    
    @IBAction func deleteDrawingTapped(sender: UIBarButtonItem)
    {
        deleteName()
        collectionView!.reloadData()
        
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
            //try //managedContext.save()
            //5
            let personToDelete = people.last!
            people.removeAtIndex(people.count - 1)
            managedContext.deleteObject(personToDelete)
          try  managedContext.save()
            // people.removeLast()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        collectionView!.reloadData()
    }
//    
//    override func setEditing(editing: Bool, animated: Bool)
//    {
//        super.setEditing(editing, animated: animated)
//        collectionView?.allowsMultipleSelection = editing
//      //  toolBar.hidden = !editing
//    }


    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}