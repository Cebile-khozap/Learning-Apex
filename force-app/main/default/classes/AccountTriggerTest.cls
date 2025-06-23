@IsTest
private class AccountTriggerTest {
    @IsTest
    static void testSetDefaultType() {
        // Create an Account with no Type value
        Account acc = new Account(Name = 'Trigger Test Co');

        Test.startTest();
        insert acc;
        Test.stopTest();

        // Fetch from DB to check the Type value
        Account inserted = [SELECT Id, Type FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Prospect', inserted.Type, 'The Type should be defaulted to Prospect');
    }
}