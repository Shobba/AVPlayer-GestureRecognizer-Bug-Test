import UIKit
import AVKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let navController = tabBarController.viewControllers?[1] as? UINavigationController,
            tabBarController.selectedIndex == 0 && navController.viewControllers.count > 1 {
            if let playerController = navController.viewControllers[1] as? AVPlayerViewController {
                playerController.player?.pause()
            }
        }
    }

}
