//
//  DetailViewController.swift
//  SwiftUitest
//
//  Created by user@59 on 20/08/1946 Saka.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var DetailImageView: UIImageView!
    
    
    @IBOutlet weak var DetailNamelabel: UILabel!
    
    
    @IBOutlet weak var DetailTypeLabel: UILabel!
    
    @IBOutlet weak var DetailDescp: UILabel!

    
    @IBOutlet weak var DetailPhone: UILabel!
    
    @IBOutlet weak var DeatilAdd: UILabel!
    
    var cafe: Cafe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        
    }
    
        func configureView() {
        guard let cafe = cafe else { return }
        
        DetailImageView.image = cafe.CafeImage
        DetailNamelabel.text = cafe.CafeName
        DetailTypeLabel.text = cafe.CafeType
        DetailDescp.text = "An upscale dining venue, features premium and seasonal imported oysters, and delicate yet creative modern European cuisines. Its oyster bar displays a full array of freshest oysters imported from all over the world including France, Australia, USA and Japan."
        
        DetailPhone.text = "983-284334"
            DeatilAdd.text = cafe.CafeAddress
    }
}
