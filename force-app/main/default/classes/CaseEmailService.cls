public class CaseEmailService {

    public static void sendResolutionEmail(Case resolvedCase) {
        // Make sure the case has a contact email
        if (String.isBlank(resolvedCase.ContactEmail)) {
            System.debug('No contact email provided for case: ' + resolvedCase.Id);
            return;
        }

        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

        // Set recipient
        email.setToAddresses(new String[] { resolvedCase.ContactEmail });

        // Set the subject and body of the email
        email.setSubject('Your Case Has Been Resolved: ' + resolvedCase.CaseNumber);

        String body = 'Dear Customer,\n\n' +
                      'Your case with the subject "' + resolvedCase.Subject + '" has been resolved.\n\n' +
                      'Resolution Notes: ' + resolvedCase.Resoluton_Notes__c + '\n\n' +
                      'Thank you for reaching out to us.\n\n' +
                      'Best regards,\nSupport Team';

        email.setPlainTextBody(body);

        // Send the email
        try {
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        } catch (Exception e) {
            System.debug('Failed to send resolution email for case ' + resolvedCase.Id + ': ' + e.getMessage());
        }
    }
}