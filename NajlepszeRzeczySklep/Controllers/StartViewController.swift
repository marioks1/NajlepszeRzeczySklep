import UIKit

class StartViewController: UIViewController {

    @IBAction func dalejButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "doGlownej", sender: self)
    }
    
}


