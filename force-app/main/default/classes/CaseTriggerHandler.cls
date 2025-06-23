public class CaseTriggerHandler {
    public static void handleTrigger(Boolean isBefore, Boolean isAfter, Boolean isInsert, Boolean isUpdate, 
                                     List<Case> newList, List<Case> oldList) {
        if (isBefore && isInsert) {
            CaseHelper.assignAgents(newList);
        }

        if (isAfter && isUpdate) {
            if (oldList != null) {
                CaseHelper.handleClosedCases(newList, oldList);
            }
        }
    }
}