from os import walk
import configparser
import logging
import sys
import time
import traceback
from stat import S_ISREG, ST_CTIME, ST_MODE
import os, sys, time
from multiprocessing import Pool
from functools import partial
from Fetcher import Fetcher

# Skipped synched databases which are not required for visualization(All the databases are test databases)             
skippedDBList = ['7ee7dff64924d9301dff21d5c56423e9-03b6e80f0d66a1bc00d61609abe05088.sqlite3', '1b2acafc6af84983d71f6f65d3909aa2-d74708eef4ed4c4ea0357a17d5f648e7.sqlite3', '1d454f49a626f8bf881d25a4bff573b2-9e382b69f1415109cd938df92ca23876.sqlite3','01913f70872eefb659241916287e05b3-0648f893932b8f45231af89e312d1279.sqlite3','01913f70872eefb659241916287e05b3-12577be5e59cc406b0f58056d9c42b22.sqlite3','1fd519422d32cd2f14e4c8814b0f744d-8a7fc64afe9433ebc92aaeab28201f22.sqlite3','172c862a59963fd3d74694328b883b2a-bdf57d6742237051f56c75ce86c1c98c.sqlite3','0a957bf1f065ad8423c2a0508878c04c-925b335076dc4e08c2ec3b72a87cdfe2.sqlite3','03eb42bf83ddf679958eed1a26dbe074-6cfe009f419405f7758e313c83b05d61.sqlite3','2d76102c4a1a16edfaf70fddb29cce74-b46858e18658e1fa34f778dd89c66329.sqlite3','04046967aeeba9612d31dcaee757f23d.sqlite3', \
                'aabb7fb13a897be1f305efce445ee6bd-1b7603d517fb211506e57ce3350fb2fd.sqlite3', 'e14d48b67b7638087b8d92f788648407-e90e6ab4fa06e92c416f46747ed951cd.sqlite3', 'f1af9f5f4f4707b189e0549de2127010.sqlite3','cde6cd67494414b51807e0c1e30b6e96-c0be159eeff7f2faaf79ed2448d8f48e.sqlite3','ca1e51f451c8de535fee68284172b2f6-cbe99ed4017220152d5521244b787341.sqlite3','6ef0c5939ba627b2abd626970a896910-6af2b549718bf50883af723cf34bc6d7.sqlite3','6ef0c5939ba627b2abd626970a896910-b6ff0d14b39bf9f42db962134c4b3b5c.sqlite3','6ef0c5939ba627b2abd626970a896910-b6ff0d14b39bf9f42db962134c4b3b5c.sqlite3','bb211b8ce8534fec23b4c59a67a809d5-6a614936f295f19fd358fc1105d0c292.sqlite3','5a3b38b8137ed8c8de23bd83d1024bba-df8a7b4563974e1e3b3c628b588e51fe.sqlite3','e5a9cceeaf7f94fab16ec46c0b25d744-4156f0f7d44ade20f7d99b545f9a96f4.sqlite3',\
                '9406efe5124a114a0baebca3536e4d2d-eda09e43a1553325bc05dd60bb37eb03.sqlite3', '9a99ebd839bae290e05a7b8cd8655551-6d6228e6a4baf4de089e4adc49519710.sqlite3', '70314cc0084e89422b7416600ab32f92.sqlite3','fea047dc69eb2200d236647505cd7fb3-4412319a2f9d33fb6140b0510b38f1f2.sqlite3','f08bb826d47fb0c92aee6b63d2e3f8df-165243d70ddebb9142b9e27b107b15b4.sqlite3','8a38c767721a2aa6403b95099d346d70-3c46457692b124adb2ef401397d7575d.sqlite3','b58d34fcf4f119be8e8dfc0d619b7f40-908a3facf9c343e2f69d57a425e0b2da.sqlite3','4574ee4d2fc31db39ac8a798f2f0de7d-7de0eedc455c5965a1aba9b3d7c46ab4.sqlite3','3a8c5c6cc8758864f5c12ed6d121accb-80f0607aefa4e95d184415d633d969fb.sqlite3','4574ee4d2fc31db39ac8a798f2f0de7d.sqlite3','8bb1ebef7e1ea0afe9b248999d2c5317-6f9abdd0d1a31a41d4791998c7b39963.sqlite3', \
                '9a3be9e7769869e36dbd8287773f32e9-68cc569bc545037e2b36258d1ec2b399.sqlite3', 'c199d75808f0c904c3e83310e2f98c28-c6735f3e115a4d6c340497272ebef4ce.sqlite3', 'cf96124ccedafb720875565a99dfbcd3-1bb0d529e5f516e48d2285658b1cb255.sqlite3','ed84019086b65806ceccd72a21123559-0d92379efc5d6518d355475693da3023.sqlite3','ed84019086b65806ceccd72a21123559-e24d12b284a7e7c489511dad92ae2f9c.sqlite3','7cce79fb3410ad6a43cba2bdf1a9692f-26de18f25b75767b9320481bdd73ef03.sqlite3', '0caac700b9d1bde127d5bd1a703a872c-e46871fe85936448fa9647333ffc0c6d.sqlite3','e0ae433e55782b0700e0261426631ca2-9f2a6bd8d7d6345dbd2839ec36dbd73e.sqlite3','d61103d58c8cce652ea9a111bafacdce-0cc88a5b420cf31586d4490897e46905.sqlite3','8d57b415d5fa26165764747d3f283c3d-7f5fae29909add3e4b63263409c13ab2.sqlite3','7b0a9ee8dc76035d4e2014359a50a5fe-4bac36ce90c777065e0c1dd5b54969e5.sqlite3','c199d75808f0c904c3e83310e2f98c28-001aa25aebc6539f05c1c378ced1df99.sqlite3',\
                'c199d75808f0c904c3e83310e2f98c28-4f2b4c37c26c3d31802eccb7c6e418cd.sqlite3', 'c199d75808f0c904c3e83310e2f98c28-41edd8476299e211a933efb25048ed4e.sqlite3', 'c199d75808f0c904c3e83310e2f98c28-c6735f3e115a4d6c340497272ebef4ce.sqlite3','cf96124ccedafb720875565a99dfbcd3-1bb0d529e5f516e48d2285658b1cb255.sqlite3','265f71d8d75b74331ebc756a70903215-6c37881eb632b670b4e89a8697eab79d.sqlite3','3cb4ef76f24e1de35fb20839b99de849-eebcb9c7deb0a186739f0f1af1f3e649.sqlite3']

class FetcherPlumber(object):

    def SourceToStagingJob(self):

        logging.basicConfig(filename='Fetcher.log', level=logging.INFO)
        logging.info('New Job..Current time is: ' + time.strftime("%c"))

        # read from configuration file
        config = configparser.ConfigParser()
        config.read('Config')

        # log related
        logfilePath = config.get('SourceLocation', 'logdirectoryPath')
        logsourceTableNames = config.get('SourceDatabase', 'logtablenames')

        logging.basicConfig(filename='Fetcher.log', level=logging.INFO)
        logging.info('log table names')
        logging.info(logsourceTableNames)

        # # content related
        # contentfilePath = config.get('SourceLocation', 'contentdirectorypath')
        # contentsourceTableNames = config.get('SourceDatabase', 'contentnames')

        # logging.basicConfig(filename='Fetcher.log', level=logging.INFO)
        # logging.info('content table names')
        # logging.info(contentsourceTableNames)

        sinkDbConnectionString = config.get('ConnectionString','sinkDbConnectionString')
        extension = config.get('SourceLocation', 'extension')

        # # load content data
        # self.LoadSourceToStaging(contentfilePath,sinkDbConnectionString,contentsourceTableNames,extension)

        # logging.basicConfig(filename='Fetcher.log', level=logging.INFO)       
        # logging.info('Successfully fetched all the content data!')

        # load log data
        self.LoadSourceToStaging(logfilePath,sinkDbConnectionString,logsourceTableNames,extension)
        logging.basicConfig(filename='Fetcher.log', level=logging.INFO)
        logging.info('Successfully fetched all the log data!')

    def LoadSourceToStaging(self, filePath,sinkDbConnectionString,sourceTableNames,extension):
        try:
            objList = []   
            dbFiles = self.getSortesListofFiles(filePath)
            sourceTableNameList = sourceTableNames.split(",")

            # logging.info('sourceTableNameList:'+ str(sourceTableNameList))
            # validate data fetched from configuration file
            if (not filePath):
                raise ValueError('Source File path is empty!')
            elif (not sinkDbConnectionString):
                raise ValueError('Sink DB connection string is empty!')
            elif (not sourceTableNames):
                raise ValueError('Source Table Names is empty!')
            elif (not dbFiles or len(dbFiles) == 0):
                raise ValueError('No Db files present!')

            # perform transfer of data from source db to sink db
            for sourceTableName in sourceTableNameList:
                obj = Fetcher()
                isCleaned = 0
                for dbfile in dbFiles:
                    if str(dbfile) in skippedDBList:
                        continue
                    dbfile = filePath+dbfile
                    sourcedbconnectionstring = 'sqlite:///' + dbfile

                    if (isCleaned == 0):
                        obj.cleansink(sourcedbconnectionstring, sourceTableName, sinkDbConnectionString)
                        isCleaned = 1
                    # obj.transferSourceToSink(sourcedbconnectionstring, sourceTableName, sinkDbConnectionString, dbfile)
                    objArgs = {'sourceDbString':sourcedbconnectionstring, 'tableName':sourceTableName, 'sinkDbSring':sinkDbConnectionString, 'dbName':dbfile}
                    objList.append(objArgs)
            obj = Fetcher()
            p = Pool(5)
            p.map(obj.transferSourceToSink, objList)
            p.close()
            p.join()

        except Exception as e:
            logging.basicConfig(filename='Fetcher.log', level=logging.ERROR)
            logging.error('There is an exception in the code FetcherPlumber!')
            logging.error(e)
            logging.error(traceback.format_exc())
            raise

    # fetch all sqlite files from the directory
    def fetchFilesFromDirectory(self, directoryPath, extension):
        
        f = []
        for (dirpath, dirnames, filenames) in walk(directoryPath):
            for file in filenames:
                if file.endswith(extension):
                    f.append(file)

        return f
    # Sort Directory based on creation date     
    def getSortesListofFiles(self, dir_path):
        f = []
        rajDB = []
        #all entries in the directory w/ stats
        data = (os.path.join(dir_path, fn) for fn in os.listdir(dir_path))
        data = ((os.stat(path), path) for path in data)

        # regular files, insert creation date
        data = ((stat[ST_CTIME], path)
           for stat, path in data if S_ISREG(stat[ST_MODE]))

        for cdate, path in sorted(data, reverse=True):
            f.append(os.path.basename(path))
        return f
       

