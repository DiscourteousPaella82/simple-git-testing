workspace  {
    model {
        group "Restaurant1"{
            frontOfHouse = softwareSystem "Front of House Management" "Entry point for diners to ring for a booking, to browse a menu or to wait for table allocation" {
                tags "primary"
            }
            kitchen = softwareSystem "Kitchen Management" "Function for managing the availability of dining resources and allocating / scheduling their availability to diners" {
                tags "primary"
            }
            dining = softwareSystem "Dining Management" "Function for managing the restaurant kitchen, including menu definitions, ingredient specifications and supplier interaction" {
                tags "primary"
            }
        }
 
        group "Restaurant2" {
            rest2 = softwareSystem "Restaurant2 Management" "A second restaurant system managing similar operations" {
                tags "primary"
            }
        }
 
        supplier = softwareSystem "Supplier Management" "Extenal system which supports supplier interaction"
        customer = person "Customer"
        maitreD = person "Maitre D"
        waiter = person "Waiter"
        headChef = person "Head Chef"
   
        #Relationships
       
            frontOfHouse -> dining "Reserve Table [REST]"
           
            kitchen -> supplier "Place supply order [REST]"
            customer -> frontOfHouse "Read Menu [REST]"
            customer -> waiter "Order Meal [sound waves]"
 
            maitreD -> customer "Greets [sound waves]"
            maitreD -> frontOfHouse "Manages Reservations [REST]"
 
            waiter -> customer "Deliver Meal [sound waves]"
            waiter -> dining "Record Order [REST]"
            waiter -> kitchen "Order Meal [REST]"
 
            headChef -> kitchen "Prepare Meals [REST]"
 
            rest2 -> supplier "Send supply order [REST]"
             
    }
 
    views {
        systemLandscape landscape "landscape" {
            include *
            autolayout lr
        }
        filtered "landscape" exclude "global" "system_landscape"
        styles {
            #Writing
            element "Element" {
                color #ffffff
            }
            element "external"{
                background #767676
            }
            element "primary"{
                background #008CFF
            }
            element "Person" {
                background #FFFFFF
                shape person
                color #000000
                stroke #000000
                strokeWidth 5
            }
            element "Container" {
                background #0267BC
            }
            element "Component" {
                background #202E3A
            }
            element "System Group" {
                background #A56EBE          
            }
            relationship "Personal" {
                color #ff0000
                dashed false
            }
        }
    }
}
