# Kolibri-ETL

## Kolibri Synchronizer

It’s an application used fetch the data from kolibri central server and transformed this data into readable format for user. The data synchronizer should synchronize the relevant data (which is needed for the visualization system) from the Kolibri database to the Nalanda database as well as perform any additional transformation. Using kolibri synchronizer we transfrorm data into some useful metrics, which helps the program manager gain more insight from the data.

## Steps to setup kolibri synchronizer:

1. Install database. Dont do it if database is installed already.

    `sudo apt-get update`
    
    `sudo apt-get install -y mysql-server`    
    
2. Create password:******, user:root
    
    `sudo mysql_secure_installation`  
    
3. Check the status of the running system

    `systemctl status mysql.service`    
    
4. Install git

    `sudo apt-get install git`    
5. Create directory structure if not present already

    `mkdir Nalanda`
    `cd Nalanda/`
    
6. Copy code using git clone

    `git clone https://github.com/nalandaproject/Kolibri-ETL.git`
    
    `cd Kolibri-ETL/Schema/`
    
7. Create staging db by running following command

    `mysql -u root -p<your mysql passowrd> --local-infile=1 < create_staging.sql`
    
8. Create nalanda db by running following command

    `mysql -u root -p<your mysql password> --local-infile=1 < create_nalanda_latest.sql`
    
9. Install dependencies

    `sudo apt install python3-pip`
    
    `pip3 install virtualenv`
    
10. Create virtual environment

    `cd Kolibri-ETL/`
    
    `virtualenv --no-site-packages ENV`
    
    `source ENV/bin/activate`
    
11. Install mysqlclient

    `sudo apt-get install -y python-dev libmysqlclient-dev`
    
	  `sudo apt-get install python3-dev`
    
12. Install dependencies

	  
    `pip3 install -r requirements.txt`
      
13. Steps for running schedular

    1.Go to Code folder to run folllowing commands
    
     `chmod +x Schedular.py`
        
     `nohup python3 Schedular.py &`
     
    2.Press enter
    
14. Steps for kill schedular

    `kill -9 <process id>`
 
