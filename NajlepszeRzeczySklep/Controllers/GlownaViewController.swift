import UIKit


class GlownaViewController: UIViewController {
    
    var kontekst: String?
    let defaults = UserDefaults.standard
    var wyczyszczonoKoszyk: Bool?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func LoupButtonPressed(_ sender: UIButton) {
        kontekst = "L"
        performSegue(withIdentifier: "Szukaj_01", sender: self)
    }
    
    @IBAction func CheckoutButtonPressed(_ sender: UIButton) {
        kontekst = "C"
        performSegue(withIdentifier: "IdzDoKoszyka_01", sender: self)
    }
    
        @IBAction func unwindDoGlownej(_ sender:UIStoryboardSegue) {
            
        }

    var s = Stale()
    
    public var wybranaKategoria: String?
    
    
    
    
    
    override func viewDidLoad() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 180, height: 180)
  
        collectionView.collectionViewLayout = layout
        
        collectionView.register(CollectionViewCell_001.nib(), forCellWithReuseIdentifier: "CollectionViewCell_001")
        
        collectionView.delegate = self
        collectionView.dataSource = self
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
extension GlownaViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        kontekst = "P"
        wybranaKategoria = s.tablicaNazw[indexPath.item]
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .bottom)
        performSegue(withIdentifier: "idzDoPrzedmiotow", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if kontekst == "P" {
            let destynacjaVC = segue.destination as! ProduktyViewController
            
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                destynacjaVC.wybranaKategoriaZGlownej = s.tablicaNazw[indexPath.item]
                destynacjaVC.s.tablicaKoszyk = s.tablicaKoszyk
            }

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
extension GlownaViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // zwroc iloś elementów w sekcji
        return s.tablicaNazw.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell_001", for: indexPath) as! CollectionViewCell_001
        
        let nowaKategoria = Kategoria()
        
        nowaKategoria.nazwa = s.tablicaNazw[indexPath.item]
        nowaKategoria.nazwaGrafiki = s.tablicaNazwGrafiki[indexPath.item]
        
        cell.configureImageCell_01(with: UIImage(named: nowaKategoria.nazwaGrafiki)!, named: nowaKategoria.nazwa)
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.3
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension GlownaViewController: UICollectionViewDelegateFlowLayout {
    // margin i padding pomiedzy komorkami
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
}
