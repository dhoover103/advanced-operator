Sample mongoDB operator using Ansible

This operator is an example of how to add backup/restore features to an ansible operator. The ondemandbackup and restore roles can be used directly in an existing Ansible operator to create backup and restore CRs.

How to add the roles to an existing project:
1. put each role in the roles directory of the existing project
2. add a new api to the project for each role. Make sure you change the group to the one your operator is already using. The kind can be set to anything.

   ```$ operator-sdk create api --group=database --kind=OnDemandBackup --version=v1alpha1```
3. Edit the main.yaml in the tasks directory to make sure the backup and restore logic makes sense for your application.

If you change/add variables to add more user customization to the backup/restore, make sure you add them to the defaults/main.yaml, and make sure they can all be set by default in the related CRs.

There is also a scheduled backup added to the mongoDB role - it takes the form of a cronjob task that you can find at the end of the mongodb/tasks/main.yaml file. This task (and the backup pvc creation before it) enables a user to create a cronjob to take automatic backups. 
