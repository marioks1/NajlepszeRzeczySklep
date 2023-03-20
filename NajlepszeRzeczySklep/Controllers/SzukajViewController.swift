import UIKit

class SzukajViewController: UIViewController {
    
    var kontekst: String = ""
    let defaults = UserDefaults.standard
    private var tablicaNazw : [String]?
    private var tablicaNazwGrafiki : [String]?
    private var tablicaCen : [Double]?
    var s = Stale()
    var przefiltrowaneDane: [String] = []
    var tablicaPrzedmiotow: [Przedmiot] = []
    var wyczyszczonoKoszyk: Bool?
    var tablicaNazwPowrot: [String]?
    var tablicaNazwGrafikiPowrot: [String]?
    var tablicCenPowrot: [Double]?
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func glownaButtonPressed(_ sender: UIButton) {
        kontekst = "K"
    }
    
    @IBAction func koszykButtonPressed(_ sender: UIButton) {
        kontekst = "C"
        performSegue(withIdentifier: "IdzDoKoszyka_03", sender: self)
    }
    
    
    override func viewDidLoad() {
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        tablicaNazw = s.nazwaGry
        tablicaNazwGrafiki = s.nazwaGrafikiGry
        tablicaCen = s.cenaGry
        
        tablicaNazw?.append(contentsOf: s.nazwaSport)
        tablicaNazwGrafiki?.append(contentsOf: s.nazwaGrafikiSport)
        tablicaCen?.append(contentsOf: s.cenaSport)
        
        tablicaNazw?.append(contentsOf: s.nazwaDom)
        tablicaNazwGrafiki?.append(contentsOf: s.nazwaGrafikiDom)
        tablicaCen?.append(contentsOf: s.cenaDom)
        
        tablicaNazw?.append(contentsOf: s.nazwaWycieczki)
        tablicaNazwGrafiki?.append(contentsOf: s.nazwaGrafikiWycieczki)
        tablicaCen?.append(contentsOf:s.cenaWycieczki)
        
        tablicaNazw?.append(contentsOf: s.nazwaOdziezy)
        tablicaNazwGrafiki?.append(contentsOf: s.nazwaGrafikiOdziez)
        tablicaCen?.append(contentsOf:s.cenaOdziez)
        
        tablicaNazw?.append(contentsOf: s.nazwaOgrod)
        tablicaNazwGrafiki?.append(contentsOf:s.nazwaGrafikiOgrod)
        tablicaCen?.append(contentsOf: s.cenaOgrod)
        
        tablicaNazw?.append(contentsOf:s.nazwaElektronika)
        tablicaNazwGrafiki?.append(contentsOf:s.nazwaGrafikiElektroniki)
        tablicaCen?.append(contentsOf:s.cenaElektroniki)
        
        tablicaNazw?.append(contentsOf:s.nazwaZdrowie)
        tablicaNazwGrafiki?.append(contentsOf:s.nazwaGrafikiZdrowie)
        tablicaCen?.append(contentsOf:s.cenaZdrowie)
        
        tablicaNazw?.append(contentsOf:s.nazwaMotoryzacja)
        tablicaNazwGrafiki?.append(contentsOf: s.nazwaGrafikiMotoryzacja)
        tablicaCen?.append(contentsOf:s.cenaMotoryzacja)
        
        tablicaNazw?.append(contentsOf:s.nazwaDziecko)
        tablicaNazwGrafiki?.append(contentsOf: s.nazwaGrafikiDziecko)
        tablicaCen?.append(contentsOf:s.cenaDziecko)
        
        tablicaNazwPowrot = tablicaNazw
        tablicaNazwGrafikiPowrot = tablicaNazwGrafiki
        tablicCenPowrot = tablicaCen
        
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 180, height: 248)
        
        collectionView.collectionViewLayout = layout
        
        collectionView.register(CollectionViewCell_002.nib(), forCellWithReuseIdentifier: "CollectionViewCell_002")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        super.viewDidLoad()
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        if let wyczyszczono = defaults.value(forKey: "WyczKosz") as? Bool {
          
            wyczyszczonoKoszyk = wyczyszczono
            if wyczyszczonoKoszyk! == true {
                s.tablicaKoszyk = []
                wyczyszczonoKoszyk = false
                defaults.set(wyczyszczonoKoszyk, forKey: "WyczKosz")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if kontekst == "K" {
            let destVC = segue.destination as! GlownaViewController
            destVC.s.tablicaKoszyk = s.tablicaKoszyk
        }
        if kontekst == "C" {
            let destVC = segue.destination as! KoszykViewController
            destVC.s.tablicaKoszyk = s.tablicaKoszyk
        }
    }
}


//MARK: - SearchBar Delegate
extension SzukajViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.text?.isEmpty == false {
            tablicaNazw = []
            tablicaCen = []
            tablicaNazwGrafiki = []
            for element in 0..<tablicaPrzedmiotow.count{
                let znalezionoElement = tablicaPrzedmiotow[element].nazwa.contains(searchBar.text!)
                if znalezionoElement == true {
                    tablicaNazw?.append(tablicaPrzedmiotow[element].nazwa)
                    tablicaNazwGrafiki?.append(tablicaPrzedmiotow[element].nazwaGrafiki)
                    tablicaCen?.append(tablicaPrzedmiotow[element].cena)
                }
                
            }
            }
            collectionView.reloadData()
            tablicaPrzedmiotow = []
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tablicaNazw = tablicaNazwPowrot
        tablicaNazwGrafiki = tablicaNazwGrafikiPowrot
        tablicaCen = tablicCenPowrot
        collectionView.reloadData()
    }
    
    
}

//MARK: - CollectionView Delegate
extension SzukajViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Dodać przedmiot do koszyka?", message: "", preferredStyle: .alert)
        
        let akcjaDodaj = UIAlertAction(title: "Dodaj", style: .default) { (akcjaDodaj) in
            let przedmiotDoKoszyka = Przedmiot()
            przedmiotDoKoszyka.nazwa = self.tablicaNazw![indexPath.row]
            przedmiotDoKoszyka.cena = self.tablicaCen![indexPath.row]
            przedmiotDoKoszyka.nazwaGrafiki = self.tablicaNazwGrafiki![indexPath.row]
            self.s.tablicaKoszyk.append(przedmiotDoKoszyka)
        }
        let akcjaOdrzuc = UIAlertAction(title: "Anuluj", style: .default) { (akcjaOdrzuc) in
            // co ma sie zadziać po anulowaniu
        }
        alert.addAction(akcjaDodaj)
        alert.addAction(akcjaOdrzuc)
        present(alert, animated: true, completion: nil)
        
    }
}

//MARK: - UICollectionViewDataSource
extension SzukajViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tablicaNazw?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell_002", for: indexPath) as! CollectionViewCell_002
        
        let nowyPrzedmiot = Przedmiot()
        
        nowyPrzedmiot.nazwa = tablicaNazw![indexPath.item]
          
        nowyPrzedmiot.nazwaGrafiki = tablicaNazwGrafiki![indexPath.item]
        
        nowyPrzedmiot.cena = tablicaCen![indexPath.item]
        
        cell.configureImageCell_01(with: UIImage(named: nowyPrzedmiot.nazwaGrafiki)!, name: nowyPrzedmiot.nazwa, price: nowyPrzedmiot.cena)
     
        tablicaPrzedmiotow.append(nowyPrzedmiot)

        self.collectionView.scrollToItem(at: indexPath, at: .top, animated: false)
   
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SzukajViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 248)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        }
}
