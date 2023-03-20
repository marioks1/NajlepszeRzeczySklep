import UIKit

class ProduktyViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var kontekst: String?
    let defaults = UserDefaults.standard
    var wyczyszczonoKoszyk: Bool?
    
    var s = Stale()
    private var p = Przedmiot()
    
    var tablicaNazw : [String]?
    var tablicaNazwGrafiki : [String]?
    var tablicaCen : [Double]?
    
    @IBAction func HomeButtonPressed(_ sender: UIButton) {
        kontekst = "K"
    }
    
    @IBAction func LopuButtonPressed(_ sender: UIButton) {
        kontekst = "L"
        performSegue(withIdentifier: "Szukaj_02", sender: self)
    }
    
    @IBAction func CheckoutButtonPressed(_ sender: UIButton) {
        kontekst = "C"
        performSegue(withIdentifier: "IdzDoKoszyka_02", sender: self)
    }
    
    
    var wybranaKategoriaZGlownej : String? {
        didSet{
            if wybranaKategoriaZGlownej == "GRY" {
                tablicaNazw = s.nazwaGry
                tablicaNazwGrafiki = s.nazwaGrafikiGry
                tablicaCen = s.cenaGry
            } else if wybranaKategoriaZGlownej == "SPORT" {
                tablicaNazw = s.nazwaSport
                tablicaNazwGrafiki = s.nazwaGrafikiSport
                tablicaCen = s.cenaSport
            } else if wybranaKategoriaZGlownej == "DOM" {
                tablicaNazw = s.nazwaDom
                tablicaNazwGrafiki = s.nazwaGrafikiDom
                tablicaCen = s.cenaDom
            } else if wybranaKategoriaZGlownej == "PODRÓŻE" {
                tablicaNazw = s.nazwaWycieczki
                tablicaNazwGrafiki = s.nazwaGrafikiWycieczki
                tablicaCen = s.cenaWycieczki
            } else if wybranaKategoriaZGlownej == "ODZIEŻ" {
                tablicaNazw = s.nazwaOdziezy
                tablicaNazwGrafiki = s.nazwaGrafikiOdziez
                tablicaCen = s.cenaOdziez
            } else if wybranaKategoriaZGlownej == "OGRÓD" {
                tablicaNazw = s.nazwaOgrod
                tablicaNazwGrafiki = s.nazwaGrafikiOgrod
                tablicaCen = s.cenaOgrod
            } else if wybranaKategoriaZGlownej == "ELEKTRONIKA" {
                tablicaNazw = s.nazwaElektronika
                tablicaNazwGrafiki = s.nazwaGrafikiElektroniki
                tablicaCen = s.cenaElektroniki
            } else if wybranaKategoriaZGlownej == "ZDROWIE" {
                tablicaNazw = s.nazwaZdrowie
                tablicaNazwGrafiki = s.nazwaGrafikiZdrowie
                tablicaCen = s.cenaZdrowie
            } else if wybranaKategoriaZGlownej == "MOTORYZACJA" {
                tablicaNazw = s.nazwaMotoryzacja
                tablicaNazwGrafiki = s.nazwaGrafikiMotoryzacja
                tablicaCen = s.cenaMotoryzacja
            } else if wybranaKategoriaZGlownej == "DZIECKO" {
                tablicaNazw = s.nazwaDziecko
                tablicaNazwGrafiki = s.nazwaGrafikiDziecko
                tablicaCen = s.cenaDziecko
            }
        }
    }
    
    override func viewDidLoad() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 180, height: 248)
        
        collectionView.collectionViewLayout = layout
        
        collectionView.register(CollectionViewCell_002.nib(), forCellWithReuseIdentifier: "CollectionViewCell_002")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationItem.title = wybranaKategoriaZGlownej
        
        self.navigationItem.setHidesBackButton(true, animated: true)
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
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
}
    
    //MARK: - UICollectionViewDelegate
    extension ProduktyViewController: UICollectionViewDelegate {
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            wybranaKategoriaZGlownej = tablicaNazw![indexPath.item]
            
            let alert = UIAlertController(title: "Dodać przedmiot do koszyka?", message: "", preferredStyle: .alert)
            
            let akcjaDodaj = UIAlertAction(title: "Dodaj", style: .default) { (akcjaDodaj) in
                let przedmiotDoKoszyka = Przedmiot()
                przedmiotDoKoszyka.nazwa = self.tablicaNazw![indexPath.item]
                przedmiotDoKoszyka.cena = self.tablicaCen![indexPath.item]
                przedmiotDoKoszyka.nazwaGrafiki = self.tablicaNazwGrafiki![indexPath.item]
                self.s.tablicaKoszyk.append(przedmiotDoKoszyka)
            }
            let akcjaOdrzuc = UIAlertAction(title: "Anuluj", style: .default) { (akcjaOdrzuc) in
                // co ma sie zadziać po anulowaniu
            }
            alert.addAction(akcjaDodaj)
            alert.addAction(akcjaOdrzuc)
            present(alert, animated: true, completion: nil)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if kontekst == "K" {
                let destynacjaVC = segue.destination as! GlownaViewController
                destynacjaVC.s.tablicaKoszyk = s.tablicaKoszyk
            }
            if kontekst == "L" {
                let destynacjaVC = segue.destination as! SzukajViewController
                destynacjaVC.s.tablicaKoszyk = s.tablicaKoszyk
            }
            if kontekst == "C" {
                let destynacjaVC = segue.destination as! KoszykViewController
                destynacjaVC.s.tablicaKoszyk = s.tablicaKoszyk
            }
        }
    }

    //MARK: - UICollectionViewDataSource
    extension ProduktyViewController: UICollectionViewDataSource {
        
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

            return cell
        }
    }

    //MARK: - UICollectionViewDelegateFlowLayout
    extension ProduktyViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 180, height: 248)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
               return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
            }
    }

    
    
    
    
    
    

