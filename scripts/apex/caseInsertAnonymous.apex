List<Case> listCase = [SELECT id,subject from case];
for (Case c : listCase) {
    c.Subject += '2';
}

update listCase;

List<Case> caseList = new List<Case>();

for (integer i = 0; i<5 ;i++) {
    Case newCase = new Case();
    newCase.Subject = 'there is a bug -v ' + i;
    newCase.Description='should be fixed urgently';
    newCase.Origin='Web';
    newCase.Status='New';
    caseList.add(newCase);

}
insert caseList;