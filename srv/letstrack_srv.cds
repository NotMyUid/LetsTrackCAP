using app.letstrack from '../db/letstrack';
service letstrackservice {

    entity Customer 
        as projection on letstrack.Customer;
    
    entity Orders 
        as projection on letstrack.Orders;

    entity Hub
        as projection on letstrack.Hub;

    entity City
        as projection on letstrack.City;
    
    entity Carrier
        as projection on letstrack.Carrier;

    entity History
        as projection on letstrack.History;

    entity Route
        as projection on letstrack.Route;

    entity Connection
        as projection on letstrack.Connection;
    
    entity Sub_Route
        as projection on letstrack.Sub_Route;  

    entity Connection_Statistics
        as projection on letstrack.Connection_Statistics;

    entity Customer_Statistics
        as projection on letstrack.Customer_Statistics;

    entity History_Statistics
        as projection on letstrack.History_Statistics;

    entity Orders_Statistics
        as projection on letstrack.Orders_Statistics;

    entity OrdStat
        as projection on letstrack.Orders_Statistics;

    entity Route_Statistics
        as projection on letstrack.Route_Statistics;

    entity Sub_Route_Statistics
        as projection on letstrack.Sub_Route_Statistics;

    entity StatCust as projection on letstrack.StatCustomer;

}

annotate letstrackservice.Customer with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Customer',
            TypeNamePlural: 'Customers',
            Title: { Value:Mail },
            Description: { Value: Name }
        },
        SelectionFields: [ Mail, Name ],
        LineItem: [
            { Value: Mail },
            { Value: Name },
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: Mail },
                { Value: Name },             
            ]
        }
    }
);

annotate letstrackservice.Orders with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Orders',
            TypeNamePlural: 'Orders',
            Title: { Value:Id },
            Description: { Value: Customer }
        },
        SelectionFields: [ Id, Customer, Hub, Route, Carrier, Time, Date ],
        LineItem: [
            { Value: Id },
            { Value: Customer },
            { Value: Hub },
            { Value: Route },
            { Value: Carrier },
            { Value: Time },
            { Value: Date },
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: Id },
                { Value: Customer },
                { Value: Hub },
                { Value: Route },
                { Value: Carrier },
                { Value: Time },
                { Value: Date },             
            ]
        }
    }
);

annotate letstrackservice.Hub with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Hub',
            TypeNamePlural: 'Hubs',
            Title: { Value: Id },
            Description: { Value: City }
        },
        SelectionFields: [ Id, City, Employees ],
        LineItem: [
            { Value: Id },
            { Value: City },
            { Value: Employees },
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: Id },
                { Value: City },
                { Value: Employees },            
            ]
        }
    }
);

annotate letstrackservice.City with @(
    UI: {
        HeaderInfo: {
            TypeName: 'City',
            TypeNamePlural: 'Cities',
            Title: { Value: Id },
            Description: { Value: Name }
        },
        SelectionFields: [ Id, Name, Location ],
        LineItem: [
            { Value: Id },
            { Value: Name },
            { Value: Location },
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: Id },
                { Value: Name },
                { Value: Location },            
            ]
        }
    }
);

annotate letstrackservice.Carrier with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Carrier',
            TypeNamePlural: 'Carriers',
            Title: { Value: Id },
            Description: { Value: Name }
        },
        SelectionFields: [ Id, Name, Cost ],
        LineItem: [
            { Value: Id },
            { Value: Name },
            { Value: Cost },
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: Id },
                { Value: Name },
                { Value: Cost },            
            ]
        }
    }
);

annotate letstrackservice.History with @(
    UI: {
        HeaderInfo: {
            TypeName: 'History',
            TypeNamePlural: 'Histories',
            Title: { Value: Id },
            Description: { Value: Order_ }
        },
        SelectionFields: [ Id, Order_, City, Time, Date ],
        LineItem: [
            { Value: Id },
            { Value: Order_ },
            { Value: City },
            { Value: Time },
            { Value: Date },
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: Id },
                { Value: Order_ },
                { Value: City },
                { Value: Time },
                { Value: Date },            
            ]
        }
    }
);

annotate letstrackservice.Route with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Route',
            TypeNamePlural: 'Routes',
            Title: { Value: Id },
            Description: { Value: Distance }
        },
        SelectionFields: [ Id, Time, Distance ],
        LineItem: [
            { Value: Id },
            { Value: Time },
            { Value: Distance },
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: Id },
                { Value: Time },
                { Value: Distance },            
            ]
        }
    }
);

annotate letstrackservice.Connection with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Connection',
            TypeNamePlural: 'Connections',
            Title: { Value: Route },
            Description: { Value: Sub_Route }
        },
        SelectionFields: [ Route, Sub_Route ],
        LineItem: [
            { Value: Route },
            { Value: Sub_Route },
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: Route },
                { Value: Sub_Route },          
            ]
        }
    }
);

annotate letstrackservice.Sub_Route with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Sub_Route',
            TypeNamePlural: 'Sub_Routes',
            Title: { Value: Id },
            Description: { Value: Starts }
        },
        SelectionFields: [ Id, Starts, Ends ],
        LineItem: [
            { Value: Id },
            { Value: Starts },
            { Value: Ends },
            { Value: Time },
            { Value: Distance },
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: Id },
                { Value: Starts },
                { Value: Ends },
                { Value: Time },
                { Value: Distance },            
            ]
        }
    }
);

annotate letstrackservice.Connection_Statistics with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Connection_Statistic',
            TypeNamePlural: 'Connection_Statistics',
            Title: { Value: AVGConnection }
        },
        SelectionFields: [ AVGConnection ],
        LineItem: [
            { Value: AVGConnection }
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: AVGConnection }            
            ]
        }
    }
);

annotate letstrackservice.Customer_Statistics with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Customer_Statistic',
            TypeNamePlural: 'Customer_Statistics',
            Title: { Value: AVGLenM }
        },
        SelectionFields: [ AVGLenM, AVGLenN, AVGLenP ],
        LineItem: [
            { Value: AVGLenM },
            { Value : AVGLenN },
            { Value : AVGLenP }
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: AVGLenM },
                { Value : AVGLenN },
                { Value : AVGLenP }            
            ]
        }
    }
);

annotate letstrackservice.History_Statistics with @(
    UI: {
        HeaderInfo: {
            TypeName: 'History_Statistic',
            TypeNamePlural: 'History_Statistics',
            Title: { Value: AVGCity}
        },
        SelectionFields: [ AVGCity ],
        LineItem: [
            { Value: AVGCity }
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: AVGCity }            
            ]
        }
    }
);

annotate letstrackservice.Orders_Statistics with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Orders_Statistic',
            TypeNamePlural: 'Orders_Statistics',
            Title: { Value: AVGOrders }
        },
        SelectionFields: [ AVGOrders, MFHub, AVGDistance, AVGTime ],
        LineItem: [
            { Value: AVGOrders },
            { Value : MFHub },
            { Value : AVGDistance },
            { Value : AVGTime }
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: AVGOrders },
                { Value : MFHub },
                { Value : AVGDistance },
                { Value : AVGTime }           
            ]
        }
    }
);

annotate letstrackservice.OrdStat with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Orders_Statistic',
            TypeNamePlural: 'Orders_Statistics',
            Title: { Value: AVGOrders }
        },
        SelectionFields: [ AVGOrders, MFHub, AVGDistance, AVGTime ],
        LineItem: [
            { Value: AVGOrders },
            { Value : MFHub },
            { Value : AVGDistance },
            { Value : AVGTime }
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: AVGOrders },
                { Value : MFHub },
                { Value : AVGDistance },
                { Value : AVGTime }           
            ]
        }
    }
);

annotate letstrackservice.Route_Statistics with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Route_Statistic',
            TypeNamePlural: 'Route_Statistics',
            Title: { Value: AVGDistance}
        },
        SelectionFields: [ AVGDistance, AVGTime ],
        LineItem: [
            { Value: AVGDistance },
            { Value : AVGTime }
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: AVGDistance },
                { Value : AVGTime }          
            ]
        }
    }
);

annotate letstrackservice.Sub_Route_Statistics with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Sub_Route_Statistic',
            TypeNamePlural: 'Sub_Route_Statistics',
            Title: { Value: AVGDistance}
        },
        SelectionFields: [ AVGDistance, AVGTime ],
        LineItem: [
            { Value: AVGDistance },
            { Value : AVGTime }
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: AVGDistance },
                { Value : AVGTime }          
            ]
        }
    }
);

annotate letstrackservice.StatCust with @(
    UI: {
        HeaderInfo: {
            TypeName: 'StatCust',
            TypeNamePlural: 'StatCusts',
            Title: { Value: Customer }
        },
        SelectionFields: [ Customer, Name, AVGDays ],
        LineItem: [
            { Value: Customer },
            { Value : Name },
            { Value : AVGDays }
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Value Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: Customer },
                { Value : Name },
                { Value : AVGDays }            
            ]
        }
    }
);