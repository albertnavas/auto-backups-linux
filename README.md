# Automated backups for files and MySQL database

You can execute this scripts with a cron.

Scripts backup a folder to .tar.gz and dump all MySQL databases to a compressed .tar.gz

- Dalily old backups are automaticaly removed after 8 days
- Weekly old backups are automaticaly removed after 31 days
- Monthly old backups aren't automaticaly removed

Cron example configuration
```
# Backups
0 2 * * * sh /backups/backup-d.sh
0 2 * * 0 sh /backups/backup-w.sh
0 2 1 * * sh /backups/backup-m.sh
```
