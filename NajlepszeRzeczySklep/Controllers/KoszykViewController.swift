import UIKit

class KoszykViewController: UIViewController, UITableViewDataSource {
    
    let s = Stale()
    
    let defaults = UserDefaults.standard
    var wyczyszczonoKoszyk = false
    var sumaWartosci: Double = 0.00
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var wartoscKoszyka: UITextField!
    
    @IBAction func dalejButtonPressed(_ sender: UIButton) {
        if sumaWartosci != 0.00 {
            performSegue(withIdentifier: "IdzDoZamowienia", sender: self)
        } else {
            let alert = UIAlertController(title: "Aby przejść do zamówienia dodaj coś do koszyka :)", message: "", preferredStyle: .alert)
            let akcjaPotwierdz = UIAlertAction(title: "OK", style: .default) { (akcjaPotwierdz) in
            }
            alert.addAction(akcjaPotwierdz)
            present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func WyczyscButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Czy na pewno chcesz wyczyścić koszyk?", message: "", preferredStyle: .alert)
        
        let akcjaPotwierdz = UIAlertAction(title: "Tak", style: .default) { (akcjaPotwierdz) in
            self.s.tablicaKoszyk = []
            self.tablicaNazw = []
            self.tablicaNazwGrafiki = []
            self.tablicaCen = []
            self.wyczyszczonoKoszyk = true
            self.defaults.set(self.wyczyszczonoKoszyk, forKey: "WyczKosz")
            self.sumaWartosci = 0.00
            let sformatowanaWartość = String(format: "%.2f", self.sumaWartosci)
            self.wartoscKoszyka.text = String("\(sformatowanaWartość) zł.")
            self.tableView.reloadData()
        }
        let akcjaOdrzuc = UIAlertAction(title: "Nie", style: .default) { (akcjaOdrzuc) in
            // co ma sie zadziać po anulowaniu
        }
        alert.addAction(akcjaPotwierdz)
        alert.addAction(akcjaOdrzuc)
        present(alert, animated: true, completion: nil)
        
    }
    
    var tablicaNazw: [String] = []
    var tablicaNazwGrafiki: [String] = []
    var tablicaCen: [Double] = []
    
    override func viewDidLoad() {
        
        defaults.set(wyczyszczonoKoszyk, forKey: "WyczKosz")
        
        
        if let koszyk = defaults.array(forKey: "Koszyk") as? [Przedmiot] {
            s.tablicaKoszyk = koszyk
        }
        
        for element in 0..<s.tablicaKoszyk.count{
            
            tablicaNazw.append(s.tablicaKoszyk[element].nazwa)
            tablicaNazwGrafiki.append(s.tablicaKoszyk[element].nazwaGrafiki)
            tablicaCen.append(s.tablicaKoszyk[element].cena)
            sumaWartosci = sumaWartosci + s.tablicaKoszyk[element].cena
            
        }
        
        tableView.estimatedRowHeight = 80
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: "TableViewCell")
        
        tableView.dataSource = self
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let sformatowanaWartość = String(format: "%.2f", sumaWartosci)
        wartoscKoszyka.text = String("\(sformatowanaWartość) zł.")
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(false, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return tablicaCen.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let przedmiotDodany = Przedmiot()

        przedmiotDodany.nazwaGrafiki = tablicaNazwGrafiki[indexPath.row] 
        przedmiotDodany.nazwa = tablicaNazw[indexPath.row]
        przedmiotDodany.cena = tablicaCen[indexPath.row]

        
        cell.configureTableViewCell_001(with: UIImage(named: przedmiotDodany.nazwaGrafiki)!, name: przedmiotDodany.nazwa, price: przedmiotDodany.cena)
        
        
        return cell
    }
}
