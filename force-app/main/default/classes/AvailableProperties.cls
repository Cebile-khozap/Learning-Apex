public with sharing class AvailableProperties {
    public String searchLocation { get; set; }
    public Decimal minPrice { get; set; }
    public Decimal maxPrice { get; set; }
    public List<Property__c> properties { get; set; }

    public AvailableProperties() {
        searchLocation = '';
        minPrice = null;
        maxPrice = null;
        loadProperties();
    }

    public void loadProperties() {
        properties = [SELECT Id, Name, Location__c, Price__c, Status__c 
                      FROM Property__c 
                      WHERE Status__c = 'Available'];
    }

    public void searchProperties() {
        String query = 'SELECT Id, Name, Location__c, Price__c, Status__c FROM Property__c WHERE Status__c = \'Available\'';
        
        if (String.isNotBlank(searchLocation)) {
            query += ' AND Location__c LIKE \'%' + searchLocation + '%\'';
        }

        if (minPrice != null) {
            query += ' AND Price__c >= ' + minPrice;
        }

        if (maxPrice != null) {
            query += ' AND Price__c <= ' + maxPrice;
        }

        properties = Database.query(query);
    }
}