
import UIKit


class secondPlanViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    /////DEAW MA CHANGEEE
    ///////// MA LEAWWW 18 APR 3PM
    var pins = pin.createList()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var planDetailCollectionView: UICollectionView!
    @IBOutlet weak var desLabel: UILabel!

    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TRIP'S NAME
        titleLabel.text = elementsName[myIndex]
        desLabel.text = elementsName[myIndex]
        planDetailCollectionView.delegate = self
        planDetailCollectionView.dataSource = self

    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return pins.count
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanDetailCollectionViewCell", for: indexPath) as! PlanDetailCollectionViewCell
        
        if desLabel.text == "Vancouver"{
            cell.mypin = pins[0]
        }
        
        if desLabel.text == "Seoul"{
            cell.mypin = pins[1]
        }
        
        return cell
    }
    
}
