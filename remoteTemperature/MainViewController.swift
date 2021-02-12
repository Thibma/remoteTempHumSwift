//
//  MainViewController.swift
//  remoteTemperature
//
//  Created by Thibault BALSAMO on 08/02/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    let tempHumWebServices: TemperatureHumidityWebServices = TemperatureHumidityWebServices()

    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        
    }
    
    func getData() {
        self.stateLabel.text = "Chargement..."
        self.tempHumWebServices.getTempHum { (tempHum) in
            guard let temp = tempHum?.temperature,
                  let hum = tempHum?.humidity else {
                self.stateLabel.text = "Erreur de connexion..."
                return
            }
            self.stateLabel.text = "Données OK"
            self.temperatureLabel.text = "\(temp) °C"
            self.humidityLabel.text = "\(hum) %"
        }
    }
    
    @IBAction func reloadPressButton(_ sender: Any) {
        self.getData()
    }

}
