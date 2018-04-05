//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by 牧野 壽永 on 2018/04/04.
//  Copyright © 2018年 牧野 壽永. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController,
                                    UISplitViewControllerDelegate {

	let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸🏏⛳️🏹🎣🥊",
        "Animals": "🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮🐷🐸🐵",
        "Faces":"😃😂😍😌😎🤩😫😰🤠😚😜"
	]
	
	override func awakeFromNib() {
        super.awakeFromNib()
		splitViewController?.delegate = self
	}
	
	@IBAction func chooseTheme(_ sender: Any) {
//        if let cvc = splitViewDetailConcentrationViewController {
//            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
//                cvc.theme = theme
//            }
//        } else if let cvc = lastSeguedToConcentrationViewController {
//            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
//                cvc.theme = theme
//            }
//            navigationController?.pushViewController(cvc, animated: true)
//        } else {
			performSegue(withIdentifier: "Choose Theme", sender: sender as! UIButton)
//		}
	}
	
	
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }

    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let identifier = segue.identifier, identifier == "Choose Theme", let cvc = segue.destination as? ConcentrationViewController {
			if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
				cvc.theme = theme
				lastSeguedToConcentrationViewController = cvc
			}
		}
		
    }


}
