import UIKit

///Subsystem 1
class HotelBooker {
    func book() {
        print("Hotel booked successfully")
    }
}

///Subsystem 2
class FlightBooker {
    func book() {
        print("Flight booked successfully")
    }
}

///Subsystem 3
class ChauffeurBooker {
    func book() {
        print("Ride booked successfully")
    }
}

///Facade

    //TODO: Create a facade class that wraps both systems and invokes each of their separate book() functions
class TravelFacade {
    let hotelBooker = HotelBooker()
    let flightBooker = FlightBooker()
    let chaufferBooker = ChauffeurBooker()
    
    func getReservations() {
        hotelBooker.book()
        flightBooker.book()
        chaufferBooker.book()
    }
}

/// Client
let travelFacade = TravelFacade()
travelFacade.getReservations()


/* This prints:
Hotel booked successfully
Flight booked successfully
*/
