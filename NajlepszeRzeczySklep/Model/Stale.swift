//
//  Stale.swift
//  NajlepszeRzeczySklep
//
//  Created by Mariusz Dziuba on 03/01/2023.
//

import Foundation


class Stale{
    
    public var tablicaKoszyk : [Przedmiot] = []
    

    
    public var tablicaNazw = ["GRY","SPORT","DOM","PODRÓŻE", "ODZIEŻ", "OGRÓD", "ELEKTRONIKA", "ZDROWIE", "MOTORYZACJA", "DZIECKO" ]
    public var tablicaNazwGrafiki = ["gry", "sport", "dom", "wycieczki", "odziez", "ogrod", "elektronika", "zdrowie", "motoryzacja", "dziecko" ]
    
    //MARK: - PRZEDIOMTY GRY
    public var nazwaGry = [
        "Gears of war",
        "Gran Turismo Sport",
        "God of war",
        "Grand Theft Auto"
        ]
    public var nazwaGrafikiGry = [
        "Gears",
        "GranTurismo",
        "God",
        "GTA",
    ]
    
    public var cenaGry = [
        100.00,
        50.00,
        350.00,
        150.00,
    ]
    
    //MARK: - PRZEDIOMTY SPORT
    public var nazwaSport = [
        "Piłka Nożna",
        "Kostium na Siłownię",
        "Paletka",
        "Wioślarz",
        "Sztanga",
        "Rower Górski"
        ]
    public var nazwaGrafikiSport = [
        "Pilka_Nozna",
        "Kostium_Silownia",
        "Paletka",
        "Wioslarz",
        "Sztanga",
        "Rower_Gorski",
    ]
    
    public var cenaSport = [
        450.00,
        670.00,
        40.00,
        20.00,
        500.00,
        230.00
    ]
    
    
    //MARK: - PRZEDIOMTY DOM
    public var nazwaDom = [
        "Paprotka",
        "Mona Lisa",
        "Doniczka",
        "Sofa",
        "Szafka Nocna",
        "Wycieraczka",
        "Tamburyn"
        ]
    public var nazwaGrafikiDom = [
        "Paprotka",
        "MonaLisa",
        "Doniczka",
        "Sofa",
        "SzafkaNocna",
        "Wycieraczka",
        "Tamburyn",
        
    ]
    
    public var cenaDom = [
        120.00,
        50.00,
        250.00,
        90.00,
        75,00,
        5.00,
        17.50
    ]
    
    
    //MARK: - PRZEDIOMTY WYCIECZKI
    public var nazwaWycieczki = [
        "Turcja 10 Dni",
        "Egipt 7 Dni",
        "Grecja 7 Dni",
        "Gwatemala 4 Dni",
        "Cypr 5 Dni",
        "Islanda 7 Dni",
        "Norwegia 10 Dni",
        "Włochy 7 Dni"
        ]
    public var nazwaGrafikiWycieczki = [
        "Turcja",
        "Egipt",
        "Grecja",
        "Gwatemala",
        "Cypr",
        "Islandia",
        "Norwegia",
        "Wlochy",
    ]
    
    public var cenaWycieczki = [
        3033.00,
        3000.50,
        2400.00,
        1500.00,
        1000.00,
        2200.00,
        3500.00,
        1500.00,
    ]
    
    //MARK: - PRZEDIOMTY ODZIEŻ
    public var nazwaOdziezy = [
        "Kurtka Skórzana",
        "Jeansy",
        "T-Shirt",
        "Bluza z Kapturem",
        "Sweter",
        ]
    
    public var nazwaGrafikiOdziez = [
        "KurtkaSkorzana",
        "Jeansy",
        "T-shirt",
        "BluzaKaptur",
        "Sweter",
    ]
    
    public var cenaOdziez = [
        2000.00,
        150.50,
        80.00,
        150.00,
        100.00,
    ]
    
    //MARK: - PRZEDIOMTY ELEKTRONIKA
    public var nazwaElektronika = [
        "iPhone 13 Pro",
        "MacBook Pro M2",
        "Samsung Galaxy S22",
        "Huawei Freebuds",
        "Huawei Matebook",
        "Xiaomi Redmi Note 11",
        ]
    public var nazwaGrafikiElektroniki = [
        "Iphone13Pro",
        "MacbookProM2",
        "GalaxyS22",
        "HuaweiFreebuds",
        "HuaweiMatebook",
        "RedMiNote11",
    ]
    
    public var cenaElektroniki = [
        6000.00,
        8000.50,
        3900.00,
        500.00,
        3130.00,
        1100.00,
    ]
    
    //MARK: - PRZEDIOMTY ZDROWIE
    public var nazwaZdrowie = [
        "Płyn do Dezynfekcji",
        "Plastry",
        "Husteczki Higieniczne",
        ]
    public var nazwaGrafikiZdrowie = [
        "PlynDezynfekcja",
        "Plastry",
        "HusteczkiHigieniczne",
    ]
    
    public var cenaZdrowie = [
        20.00,
        100.50,
        50.00,
    ]
    
    //MARK: - PRZEDIOMTY MOTORYZACJA
    public var nazwaMotoryzacja = [
        "Płyn do Czyszczenia Kabiny",
        "Kołpaki 4 szt.",
        "Odświerzacz Powietrza",
        "Opony Dębica 4 szt.",
        ]
    public var nazwaGrafikiMotoryzacja = [
        "PlynCzystaKonsola",
        "Kolpaki",
        "OdswierzaczSamochodowy",
        "OponyDebica",
    ]
    
    public var cenaMotoryzacja = [
        20.00,
        100.50,
        50.00,
        1000.00,
    ]
    
    //MARK: - PRZEDIOMTY DZIECKO
    public var nazwaDziecko = [
        "Jaś",
        "Małgosia",
        "Bolek",
        "Lolek",
        ]
    public var nazwaGrafikiDziecko = [
        "Jas",
        "Malgosia",
        "Bolek",
        "Lolek",
    ]
    
    public var cenaDziecko = [
        500.00,
        500.00,
        500.00,
        500.00,
    ]
    
    //MARK: - PRZEDIOMTY OGRÓD
    public var nazwaOgrod = [
        "Paprotka",
        "Kosiarka Spalinowa",
        "Piła Łańcuchowa",
        "Kwiatek w Doniczce",
        ]
    public var nazwaGrafikiOgrod = [
        "Paprotka",
        "KosiarkaSpalinowa",
        "PilaLancuchowa",
        "KwiatekDoniczka",
    ]
    
    public var cenaOgrod = [
        20.00,
        1000.50,
        500.00,
        5.00,
    ]
}
