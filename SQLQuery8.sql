select * from vendor
---single column 
create nonclustered index IX_Exam_Name
	on Exam (Name ASC)

---multicolumn
create nonclustered index IX_Exam_Name_Cost
	on Exam (Name ASC, Cost ASC)

select * from exam
select name, cost from exam where cost >= 150

create nonclustered index IX_LearnerCertifications_DateAcquired
on LearnerCertifications (DateAcquired ASC)


select learner.name, certification.name, dateacquired
from learnercertifications
join learner on LearnerCertifications.LearnerID = learner.learnerid
join certification on LearnerCertifications.CertificationID = Certification.CertificationId
where year(DateAcquired) = '2010'

