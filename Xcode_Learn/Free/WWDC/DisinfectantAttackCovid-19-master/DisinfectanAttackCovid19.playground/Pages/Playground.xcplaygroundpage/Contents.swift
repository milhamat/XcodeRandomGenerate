/*:
## Disinfectant Attack Covid-19 👾
 ### Story
 An outbreak occurred in a city. The president instructed the army to sterilize the city. But no one dares to do it because the
 virus is very, very deadly. Ludy, a cadet-ranking soldier dared to volunteer to carry out the mission.
 The president instructs Ludy to kill  viruses in the city.
 "You can't miss anything! The entire city's life is on your hand!"
### The Goal
 Attack all viruses  with your disinfectant. Try to eradicate all viruses   as much as you can.
 
 " You can't miss anything! The entire city's life is on your hand! "
### How to play
 Enter this file into your playground  Attack all viruses  using the disinfectany that you have by clicking on the touchpad on your Macbook
### Credit
 My music background is taken from Fred Bouchal's YouTube account and Sound spray is taken from my Sound Laboratory YouTube account. The object used is   it was designed by me  except for the virus image downloaded from the free vector. The codes that I learned also came from raywanderlich.com
 
### For All
 Thank you for your concern.
 Hopefully this Corona virus will pass soon
 
#StaySafe #SocialDistancing #StayHome
*/

import SpriteKit
import PlaygroundSupport

let skView = SKView(frame: .zero)

let gameScene = GameScene(size: UIScreen.main.bounds.size)
gameScene.scaleMode = .aspectFill
skView.presentScene(gameScene)

PlaygroundPage.current.liveView = skView
PlaygroundPage.current.wantsFullScreenLiveView = true
