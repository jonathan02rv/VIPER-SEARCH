# VIPER-SEARCH
User can enter an acronym or initialism to a list of corresponding meanings

# VIPER / UIKit
This project showed 3 layers: UI, Domain, and Data layer for decoupling the code from the user interface, business logic, and the network or local data source.
I implemented VIPER on UI Layer for this example.

UI Layer (iOS project):
-----------------------
- In this example, I implemented VIPER design pattern with UIKit for UI Layer. But we can use MVVM, MVVM-C, MVP, MVC and so on.
- Our View has a Presenter who responds to the view request
- Our Presenter has a weak view reference to update it
- Our Presenter has a router to handle the navigation views
- Our Presenter has an interactor who take the use cases
- Our Interactor has a weak presenter reference to response to him
- Our Interactor depend of useCases
- We must have only the use case methods that each view will use.

Domain Layer (Framework project):
------------------------------------
- There are the business logic and repository protocol will be implemented in Data Layer
- We have any methods approach to a specific use cases group.

Data Layer (Framework proyect):
----------------------------------
- There is the implementation of Data Source and we can choose where from we want to get our data (web API, local Data, ... )
- For this example I implemented only networkDatasource, but our repository class can has a localDatasource also.
- Web API: We can implement URLSESSION, Alamofire, and so on. (In this example I implemented URLSESSION)
- Local Data: We can implement userDefaults, local files, CoreData, Keychain, and so on. (In this example I implemented local file)


The Architecture's diagram:

![VIPER_CLEN](https://user-images.githubusercontent.com/29233230/133003886-1c134958-76d1-40f5-b7b6-d982175ff640.jpeg)
