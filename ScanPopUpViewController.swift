//
//  ScanPopUpViewController.swift
//  ISMOriginalWork
//
//  Created by Gauri Pala on 11/27/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import Foundation
import UIKit

class ScanPopUpViewController:UIViewController{
    
    @IBOutlet weak var popUp: UIView!
    @IBOutlet weak var predLabel: UILabel!
    @IBOutlet weak var item: UILabel!
    @IBOutlet weak var recycle: UILabel!
    @IBOutlet weak var info: UILabel!
    var scanView = ScanViewController.init()
    var prediction = ""
    var index = 0
    
    override func viewDidLoad() {
        popUp.layer.cornerRadius = 20
        predLabel.text = prediction
        if(index==1){
            item.text = "Plastic"
            recycle.text = "• Curbside Recycling Allowed"
            info.text = "• Plastics that can be Recycled Curbside: #1, #2, #5\n• #1 (PET): Soft Drink Bottles, Food Packaging\n• #2 (HDPE): Milk Cartons, Detergent Bottles, Toys\n• #5 (PP): Bottle Tops, Kitchenware, Disposable Plates"
        }
        else if(index==2){
            item.text = "Glass"
            recycle.text = "• Curbside Recycling Allowed"
            info.text = "• Usually, Only Clean Glass is Accepted at Recycling Plants\n• Only Beverage and Food Bottles and Jars Accepted\n• Other Glass Items have Higher Melting Points (cannot be recycled)"
        }
        else if(index==3){
            item.text = "Cardboard"
            recycle.text = "• Curbside Recycling Allowed"
            info.text = "• Usually, Only Clean Cardboard is Accepted at Recycling Plants\n• 90% of Products are Shipped In Cardboard, Creating a Large Amount of Cardboard Production"
        }
        else if(index==4){
            item.text = "Metal"
            recycle.text = "• Curbside Recycling Allowed"
            info.text = "• Aluminium Recycling is very Fast. It Takes Only About 2 Months to Create Another Product From it\n• Scrap Metal Pieces can Only be Dropped Off (not accepted curbside)\n• Steel And Alumininum are Curbside"
        }
        else if(index==5){
            item.text = "Paper"
            recycle.text = "• Curbside Recycling Allowed"
            info.text = "• Many Kinds of Papers can be Recycled: Office Paper, Newspaper, Colored Paper, Magazines, Phone Books, Etc.\n• You can Recycle Your Own Paper at Home Using Scraps From Other Pieces\n• Paper is the Most Commonly Recycled Material"
        }
        else if(index==6){
            item.text = "Styrofoam"
            recycle.text = "• Drop-off Recycling Only"
            info.text = "• Styrofoam Absolutely Cannot be Curbside Recycling\n• If Styrofoam is Sent to the Landfill, it Often Sits There Forever\n• Some Styrofoam Products have The Recyclable Symbol On it, But it Still Needs to be Dropped Off"
        }
        else if(index==7){
            item.text = "Textile"
            recycle.text = "• Drop-off Recycling or Donation"
            info.text = "• Clothes can also be Reused at Home by Making New Products Out of Them (ex: masks, cloths, etc)\n• If a Garnment Piece is Not Suited for Donation, it is Best to Recycle it at a Drop Off Location.\n• Clothing cannot go in Curbside Bins as it Clogs Up Machines"
            
        }
        else if(index==8){
            item.text = "Battery"
            recycle.text = "• Drop-off Recycling Only"
            info.text = "• Batteries Must Only Be Taken to an Approved Hazardous Waste Site (usually any recycling center)\n• In Many Cases, Retailers Who Sell Batteries have a Designated Spot for Battery Recycle\n• A Lot of Schools Commonly have Battery Drop-Off Bins"
        }
        else if(index==9){
            item.text = "Plastic Bag"
            recycle.text = "• Drop-off Recycling Only"
            info.text = "• Plastic Bags are Plastic #4 which can't be Recycled Curbside\n• Many Stores will have a Spot for Plastic Bag Recycling for Future Use"
        }
        else if(index == 10){
            item.text = "Organic Waste"
            recycle.text = "• Compost Bin Only"
            info.text = "• It is Great to Start a Compost Bin at your House which will Allow You to Properly Recycle Your Organic Waste\n• Recycling Organic Waste Plays a Key Role in Reducing Greenhouse Gas Emissions"
        }
        else{
            predLabel.text = "Couldn't Identify or Trash"
            item.text = ""
            recycle.text = ""
            info.text = ""
        }

    }
    
    
    @IBAction func back(_ sender: Any) {
        //scanView.captureSession.startRunning()
        self.presentingViewController!.dismiss(animated: true, completion: nil)
        
    }
    
}
