public class TaskHelper {
    
    public static void updateContactEngagement(List<Task> tasks) {
        
        // Map to hold related Contact Ids and their Task records
        Map<Id, Task> contactIdToTaskMap = new Map<Id, Task>();

        for (Task t : tasks) {
            // Filter only completed follow-up calls linked to a Contact
            if (
                t.Subject == 'Follow-up Call' &&
                t.Status == 'Completed' &&
                t.WhoId != null &&
                String.valueOf(t.WhoId).startsWith('003') // '003' prefix indicates Contact
            ) {
                contactIdToTaskMap.put(t.WhoId, t);
            }
        }

        if (contactIdToTaskMap.isEmpty()) return;

        // Query the related contacts
        List<Contact> contactsToUpdate = [
            SELECT Id, Last_Follow_Up_Date__c, Engagement_Status__c
            FROM Contact
            WHERE Id IN :contactIdToTaskMap.keySet()
        ];

        for (Contact con : contactsToUpdate) {
            Task relatedTask = contactIdToTaskMap.get(con.Id);
            
            // Make sure the task has a valid date before assigning
            if (relatedTask != null && relatedTask.ActivityDate != null) {
                con.Last_Follow_Up_Date__c = relatedTask.ActivityDate;
            }
            
            // Ensure this matches the picklist value in your org
            con.Engagement_Status__c = 'Contacted';
        }

        if (!contactsToUpdate.isEmpty()) {
            try {
                update contactsToUpdate;
            } catch (DmlException e) {
                System.debug('Error updating contacts: ' + e.getMessage());
            }
        }
    }
}