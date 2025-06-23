public class OpportunityHelper {
 
    public static void updateKeyContacts(List<Opportunity> opps) {
        Set<Id> oppIds = new Set<Id>();
        for (Opportunity opp : opps) {
            oppIds.add(opp.Id);
        }
 
        Map<Id, Contact> contactsToUpdate = new Map<Id, Contact>();
 
        List<OpportunityContactRole> roles = [
            SELECT ContactId
            FROM OpportunityContactRole
            WHERE OpportunityId IN :oppIds
        ];
 
        for (OpportunityContactRole role : roles) {
            if (role.ContactId != null) {
                contactsToUpdate.put(role.ContactId, new Contact(
                    Id = role.ContactId,
                    Is_Key_Contact__c = true
                ));
            }
        }
 
        if (!contactsToUpdate.isEmpty()) {
            update contactsToUpdate.values();
        }
    }
}