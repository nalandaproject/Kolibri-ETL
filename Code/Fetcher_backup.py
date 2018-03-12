"""This class fetches data from source sqlite file and dumps into staging db"""
import logging
import traceback
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine
from sqlalchemy import MetaData, Table
from sqlalchemy import orm
from sqlalchemy import select, update
from dateutil.parser import parse
import datetime
class Fetcher(object):
    """This class fetches data from source sqlite file and dumps into staging db"""

    def cleansink(self, sourcedbconnectionstring, sourceTableName, sinkDbConnectionString):
        """It cleans the staging db"""

        # Fetch data structure from source Table
        sourceDbEngine = create_engine(sourcedbconnectionstring)
        sourceDbEngine.echo = False
        metadata = MetaData(bind=sourceDbEngine)
        EntityTable = Table(sourceTableName, metadata, autoload=True)

        # establish sink connection
        sinkDbEngine = create_engine(sinkDbConnectionString)
        sinkConnection = sinkDbEngine.connect()
        sinkConnection.execute(EntityTable.delete())


    def transferSourceToSink(self, argsList):
        """fetches data from source and dump into sink"""
        print("started fetching kolibri data:", argsList[0])
        # sourcedbconnectionstring = argsList[]
        try:
            # Establish source connection
            sourceDbEngine = create_engine(argsList[0])
            # sourceDbEngine = create_engine(sourcedbconnectionstring)
            sourceDbEngine.echo = False
            metadata = MetaData(bind=sourceDbEngine)

            # Fetch data structure from source table
            EntityTable = Table(argsList[1], metadata, autoload=True)
            #logging.info("sourceTableName:"+ str(sourceTableName))
            # establish sink connection
            sinkDbEngine = create_engine(argsList[2])

            sinkConnection = sinkDbEngine.connect()
    
            class Entity(object):
                """These are the empty classes that will become our data classes"""
                pass

            # Map data structure of source  table to Entity class
            orm.mapper(Entity, EntityTable)

            # Fetch all data from source table
            Entity = EntityTable.select().execute()
            # logging.info("sourceTableName:"+ str(EntityTable.name))
            # Insert data from source db to sink db
            userList = ['65dab64b29b49acb0833ba265bae8dec','311ea41a1508f3f9dd12df88e9278661']
            logging.info("started Fetched database name:"+ argsList[3])
            for row in Entity:
                # change the datatype when you make the final changes
                if str(EntityTable.name) == 'kolibriauth_facilityuser':
                    # logging.info("Row:"+ str(row))
                    # if not isinstance(row[8], datetime.datetime):
                    #     row[8] = parse(row[8].replace("(Asia/Kolkata)",""))
                    userID = str(row[2])
                    if userID in userList:
                        continue
                    select_st = select([EntityTable]).where(EntityTable.c.id == str(row[2]))
                    res = sinkConnection.execute(select_st)
                    if int(res.rowcount) == 0:
                        # logging.info("inside if")
                        sinkConnection.execute(EntityTable.insert(), row)
                    else:  
                        # logging.info("inside else kolibriauth_facilityuser")       
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[2])).values({EntityTable.c.password: row[0],EntityTable.c.last_login: row[1], EntityTable.c._morango_dirty_bit: row[3], \
                               EntityTable.c._morango_source_id:row[4], EntityTable.c._morango_partition:row[5], EntityTable.c.username: row[6], EntityTable.c.full_name:row[7], \
                               EntityTable.c.date_joined:row[8], EntityTable.c.dataset_id:row[9], EntityTable.c.facility_id:row[10]})
                        # logging.info(str(stmt))
                        # sinkConnection.execute(EntityTable.update(), row)
        
                elif str(EntityTable.name) == 'kolibriauth_collection':
                    select_st = select([EntityTable]).where(EntityTable.c.id == str(row[0]))
                    res = sinkConnection.execute(select_st)
                    if int(res.rowcount) == 0:
                        sinkConnection.execute(EntityTable.insert(), row)
                    else:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.name: row[4], EntityTable.c.kind:row[5], \
                               EntityTable.c.lft:row[6], EntityTable.c.rght:row[7], EntityTable.c.tree_id:row[8], EntityTable.c.level:row[9], EntityTable.c.dataset_id:row[10], \
                               EntityTable.c.parent_id:row[11]})
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)  

                elif str(EntityTable.name) == 'kolibriauth_role':
                    select_st = select([EntityTable]).where(EntityTable.c.id == str(row[0]))
                    res = sinkConnection.execute(select_st)
                    if int(res.rowcount) == 0:
                        sinkConnection.execute(EntityTable.insert(), row)
                    else:
                        # logging.info("inside else kolibriauth_role")
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.kind: row[4], EntityTable.c.collection_id:row[5], \
                               EntityTable.c.dataset_id:row[6], EntityTable.c.user_id:row[7]})
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)  
                elif str(EntityTable.name) == 'logger_contentsessionlog':
                    select_st = select([EntityTable]).where(EntityTable.c.id == str(row[0]))
                    res = sinkConnection.execute(select_st)
                    if int(res.rowcount) == 0:
                        sinkConnection.execute(EntityTable.insert(), row)
                    else:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.content_id: row[4], EntityTable.c.channel_id:row[5], \
                               EntityTable.c.start_timestamp:row[6], EntityTable.c.end_timestamp:row[7], EntityTable.c.time_spent:row[8], EntityTable.c.progress:row[9], EntityTable.c.kind:row[10], \
                               EntityTable.c.extra_fields:row[11], EntityTable.c.dataset_id:row[12], EntityTable.c.user_id:row[13]})
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)  
                elif str(EntityTable.name) == 'kolibriauth_membership':
                    select_st = select([EntityTable]).where(EntityTable.c.id == str(row[0]))
                    res = sinkConnection.execute(select_st)
                    if int(res.rowcount) == 0:
                        sinkConnection.execute(EntityTable.insert(), row)
                    else:
                        # logging.info("inside else kolibriauth_role")
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.collection_id: row[4], \
                               EntityTable.c.dataset_id:row[5], EntityTable.c.user_id:row[6]})
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)  
                elif str(EntityTable.name) == 'logger_attemptlog':
                    select_st = select([EntityTable]).where(EntityTable.c.id == str(row[0]))
                    res = sinkConnection.execute(select_st)
                    if int(res.rowcount) == 0:
                        sinkConnection.execute(EntityTable.insert(), row)
                    else:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.item: row[4],EntityTable.c.start_timestamp:row[5] , \
                               EntityTable.c.end_timestamp:row[6],EntityTable.c.completion_timestamp:row[7],EntityTable.c.time_spent:row[8], EntityTable.c.complete:row[9], EntityTable.c.correct:row[10], \
                               EntityTable.c.hinted:row[11], EntityTable.c.answer:row[12], EntityTable.c.simple_answer:row[13],EntityTable.c.interaction_history:row[14],EntityTable.c.dataset_id:row[15], \
                               EntityTable.c.masterylog_id:row[16], EntityTable.c.sessionlog_id:row[17], EntityTable.c.user_id:row[18] })
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)  
                elif str(EntityTable.name) == 'logger_contentsummarylog':
                    select_st = select([EntityTable]).where(EntityTable.c.id == str(row[0]))
                    res = sinkConnection.execute(select_st)
                    if int(res.rowcount) == 0:
                        sinkConnection.execute(EntityTable.insert(), row)
                    else:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.content_id: row[4], EntityTable.c.channel_id:row[5], \
                               EntityTable.c.start_timestamp:row[6], EntityTable.c.end_timestamp:row[7],EntityTable.c.completion_timestamp:row[8],EntityTable.c.time_spent:row[9], EntityTable.c.progress:row[10], EntityTable.c.kind:row[11], \
                               EntityTable.c.extra_fields:row[12], EntityTable.c.dataset_id:row[13], EntityTable.c.user_id:row[14]})
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)  
                elif str(EntityTable.name) == 'logger_masterylog':
                    select_st = select([EntityTable]).where(EntityTable.c.id == str(row[0]))
                    res = sinkConnection.execute(select_st)
                    if int(res.rowcount) == 0:
                        sinkConnection.execute(EntityTable.insert(), row)
                    else:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.mastery_criterion: row[4], \
                               EntityTable.c.start_timestamp:row[5], EntityTable.c.end_timestamp:row[6], EntityTable.c.completion_timestamp:row[7], EntityTable.c.mastery_level:row[8], EntityTable.c.complete:row[9], \
                               EntityTable.c.dataset_id:row[10], EntityTable.c.summarylog_id:row[11], EntityTable.c.user_id:row[12]})
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)
                else:    
                    sinkConnection.execute(EntityTable.insert(), row)
            logging.info("End database fetced name:"+ argsList[3])

        # session.close()
        except Exception as e:
            logging.basicConfig(filename='Fetcher.log', level=logging.ERROR)
            logging.error('There is an exception in the code Fetcher!')
            logging.error(e)
            logging.error(traceback.format_exc())
            raise
