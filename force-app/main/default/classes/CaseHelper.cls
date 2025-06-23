public class CaseHelper {

    public static void assignAgents(List<Case> cases) {
        Set<String> priorities = new Set<String>();
        for (Case c : cases) {
            if (c.Agent_Name__c == null && c.Priority != null) {
                priorities.add(c.Priority);
            }
        }

        Map<String, List<Agent__c>> priorityToAgents = new Map<String, List<Agent__c>>();
        for (Agent__c agent : [
            SELECT Id, Name, Priority__c
            FROM Agent__c
            WHERE Status__c = 'Available' AND Priority__c IN :priorities
        ]) {
            if (!priorityToAgents.containsKey(agent.Priority__c)) {
                priorityToAgents.put(agent.Priority__c, new List<Agent__c>());
            }
            priorityToAgents.get(agent.Priority__c).add(agent);
        }

        for (Case c : cases) {
            if (c.Agent_Name__c == null && priorityToAgents.containsKey(c.Priority)) {
                List<Agent__c> agents = priorityToAgents.get(c.Priority);
                if (!agents.isEmpty()) {
                    c.Agent_Name__c = agents.remove(0).Id;
                }
            }
        }
    }

    public static void handleClosedCases(List<Case> newList, List<Case> oldList) {
        for (Integer i = 0; i < newList.size(); i++) {
            Case newCase = newList[i];
            Case oldCase = oldList[i];

            if (newCase.Status == 'Closed' && oldCase.Status != 'Closed') {
                if (String.isBlank(newCase.Resoluton_Notes__c)) {
                    newCase.addError('Resolution Notes must be filled before closing.');
                } else {
                    CaseEmailService.sendResolutionEmail(newCase);
                }
            }
        }
    }
}