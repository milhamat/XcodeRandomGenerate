import Foundation
import UIKit

public struct K {
    public struct Main {
        public static let titleApp = "Safe Quake"
        public static let descApp = "Learn how to behave properly when earthquake happening in front of you!"
        
        public static let aboutDesc = "This is an app made as guiding resource for you who often don't know what it is needed to do when there is an earthquake coming near you whether you inside building or in open space."
        public static let aboutCopyright = "Resource: \n Background by freepik.com, Icons by flaticon.com, Sound by: zapsplat.com"
        
        public static let defViewSize = CGRect(x: 0, y: 0, width: 600, height: 600)

    }
    
    public struct Font {
        public struct AvenirNext {
            public static let Bold = "AvenirNext-Bold"
            public static let DemiBold = "AvenirNext-DemiBold"
            public static let Medium = "AvenirNext-Medium"
            public static let Regular = "AvenirNext-Regular"
        }
    }
    
    public struct Data {
        public static let eqInData = [
            "Stay calm! If you're indoors, stay inside.",
            "Stay away from glass, windows, outside doors and walls, and anything that could fall, such as lighting fixtures or furniture.",
            "Wherever you are, drop onto your hands and knees. This position helps keep you from being knocked down, and allows you to crawl to shelter.",
            "With one arm and hand, cover your head and neck. If there is a nearby desk or table, crawl under it for shelter. If there’s no shelter, crawl next to an interior wall away from windows.",
            "If you’re under shelter, hold onto it with one hand. If there’s no shelter, hold on to your head and neck with both arms and hands.",
            "If you happened to be in home, turn off the gas, water, and electricity.",
            "Don't leave heavy objects on shelves (they'll fall during a quake)",
            "Anchor heavy furniture, cupboards, and appliances to the walls or floor.",
            "Don't use elevators (they'll probably get stuck anyway).",
            "If you are in bed, hold on and stay there, protecting your head with a pillow. You are less likely to be injured staying where you are."
        ]
        
        public static let eqOutData = [
            "Stay calm! If you're outside, stay outside.",
            "Make up a plan of where to meet your family after an earthquake.",
            "If you're in a car, stop the car and stay inside the car until the earthquake stops.",
            "Once in the open, stay there until the shaking stops. The greatest danger exists directly outside buildings, at exits and alongside exterior walls.",
            "Proceed cautiously once the earthquake has stopped. Avoid roads, bridges, or ramps that might have been damaged by the earthquake.",
            "Stay in the open away from power lines or anything that might fall. Stay away from buildings (stuff might fall off the building or the building could fall on you).",
            "If you're at the movies or a sports game, stay at your seat and protect your head and neck with your arms. Don't try to leave until the shaking is over. Then walk out slowly watching for anything that could fall in the aftershocks.",
            "If you happened on the beach, remain calm and find higher ground nearby because earthquake can possibly trigger tsunami.",
            "If you happen to be on a mountain when an earthquake occurs, move to an open area away from the slope.",
        ]
    }
}
