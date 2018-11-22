"""This class fetches data from source sqlite file and dumps into staging db"""
import logging
import traceback
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine
from sqlalchemy import MetaData, Table
from sqlalchemy import orm
from sqlalchemy import select, update, insert
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
        # sourcedbconnectionstring = argsList[]
        try:
            # Establish source connection
            sourceDbEngine = create_engine(argsList['sourceDbString'])
            # sourceDbEngine = create_engine(sourcedbconnectionstring)
            sourceDbEngine.echo = False
            metadata = MetaData(bind=sourceDbEngine)

            # Fetch data structure from source table
            EntityTable = Table(argsList['tableName'], metadata, autoload=True)
            # EntityTable = Table(sourceTableName, metadata, autoload=True)
            
            # establish sink connection
            sinkDbEngine = create_engine(argsList['sinkDbSring'])
            # sinkDbEngine = create_engine(sinkDbConnectionString)

            sinkConnection = sinkDbEngine.connect()
    
            class Entity(object):
                """These are the empty classes that will become our data classes"""
                pass

            # Map data structure of source  table to Entity class
            orm.mapper(Entity, EntityTable)
    
            # Fetch all data from source table
            Entity = EntityTable.select().execute()
            # Insert data from source db to sink db
            logging.basicConfig(filename='Fetcher.log', level=logging.INFO)
            logging.info("started Fetched database name:"+ argsList['dbName'])
            current_time = datetime.datetime.now()
            logging.info("Startedtime:"+ current_time.strftime('%D:%H:%M:%S'))
            for row in Entity:
                # change the datatype when you make the final changes
                if str(EntityTable.name) == 'kolibriauth_facilityuser':
                    res = self.checkRecordExist(str(row[2]), EntityTable, sinkConnection, row)
                    if res != 0:      
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[2])).values({EntityTable.c.password: row[0],EntityTable.c.last_login: row[1], EntityTable.c._morango_dirty_bit: row[3], \
                               EntityTable.c._morango_source_id:row[4], EntityTable.c._morango_partition:row[5], EntityTable.c.username: row[10], EntityTable.c.full_name:row[6], \
                               EntityTable.c.date_joined:row[7], EntityTable.c.dataset_id:row[8], EntityTable.c.facility_id:row[9]})
                        sinkConnection.execute(stmt)
        
                elif str(EntityTable.name) == 'kolibriauth_collection':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0: 
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.name: row[4], EntityTable.c.kind:row[10], \
                               EntityTable.c.lft:row[5], EntityTable.c.rght:row[6], EntityTable.c.tree_id:row[7], EntityTable.c.level:row[8], EntityTable.c.dataset_id:row[9], \
                               EntityTable.c.parent_id:row[11]})
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)  

                elif str(EntityTable.name) == 'kolibriauth_role':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0: 
                        # logging.info("inside else kolibriauth_role")
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.kind: row[7], EntityTable.c.collection_id:row[4], \
                               EntityTable.c.dataset_id:row[5], EntityTable.c.user_id:row[6]})
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)  

                elif str(EntityTable.name) == 'logger_contentsessionlog':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0: 
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.content_id: row[4], EntityTable.c.channel_id:row[5], \
                               EntityTable.c.start_timestamp:row[13], EntityTable.c.end_timestamp:row[6], EntityTable.c.time_spent:row[7], EntityTable.c.progress:row[8], EntityTable.c.kind:row[9], \
                               EntityTable.c.extra_fields:row[10], EntityTable.c.dataset_id:row[11], EntityTable.c.user_id:row[12]})
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)

                elif str(EntityTable.name) == 'kolibriauth_membership':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0: 
                        # logging.info("inside else kolibriauth_role")
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.collection_id: row[4], \
                               EntityTable.c.dataset_id:row[5], EntityTable.c.user_id:row[6]})
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)  
                elif str(EntityTable.name) == 'logger_attemptlog':
                   res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                   if res != 0: 
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.item: row[4],EntityTable.c.start_timestamp:row[18] , \
                               EntityTable.c.end_timestamp:row[5],EntityTable.c.completion_timestamp:row[6],EntityTable.c.time_spent:row[7], EntityTable.c.complete:row[8], EntityTable.c.correct:row[9], \
                               EntityTable.c.hinted:row[10], EntityTable.c.answer:row[11], EntityTable.c.simple_answer:row[12],EntityTable.c.interaction_history:row[13],EntityTable.c.dataset_id:row[14], \
                               EntityTable.c.masterylog_id:row[15], EntityTable.c.sessionlog_id:row[16], EntityTable.c.user_id:row[17] })
                        # logging.info(str(stmt))
                        
                        sinkConnection.execute(stmt)  
                elif str(EntityTable.name) == 'logger_contentsummarylog':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0: 
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.content_id: row[4], EntityTable.c.channel_id:row[5], \
                               EntityTable.c.end_timestamp:row[6],EntityTable.c.completion_timestamp:row[7],EntityTable.c.time_spent:row[8], EntityTable.c.progress:row[9], EntityTable.c.kind:row[10], \
                               EntityTable.c.extra_fields:row[11], EntityTable.c.dataset_id:row[12], EntityTable.c.user_id:row[13], EntityTable.c.start_timestamp:row[14]})
                        # logging.info(str(stmt))
            
                        
                        sinkConnection.execute(stmt)  
                elif str(EntityTable.name) == 'logger_masterylog':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.mastery_criterion: row[4], \
                               EntityTable.c.start_timestamp:row[12], EntityTable.c.end_timestamp:row[5], EntityTable.c.completion_timestamp:row[6], EntityTable.c.mastery_level:row[7], EntityTable.c.complete:row[8], \
                               EntityTable.c.dataset_id:row[9], EntityTable.c.summarylog_id:row[10], EntityTable.c.user_id:row[11]})
                        # logging.info(str(stmt))
                        
                        sinkConnection.execute(stmt)
                elif str(EntityTable.name) == 'logger_usersessionlog':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.channels: row[4], \
                               EntityTable.c.start_timestamp:row[5], EntityTable.c.last_interaction_timestamp:row[9], EntityTable.c.pages:row[6],\
                               EntityTable.c.dataset_id:row[7], EntityTable.c.user_id:row[8]})
                        # logging.info(str(stmt))
                        sinkConnection.execute(stmt)
                elif str(EntityTable.name) == 'lessons_lesson':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.title: row[4], \
                               EntityTable.c.description:row[5], EntityTable.c.resources:row[6], EntityTable.c.is_active:row[7],\
                               EntityTable.c.collection_id:row[8], EntityTable.c.created_by_id:row[9], EntityTable.c.dataset_id:row[10], EntityTable.c.date_created:row[11]})
                        # logging.info(str(stmt))
                elif str(EntityTable.name) == 'exams_exam':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.title: row[4], \
                               EntityTable.c.channel_id:row[5], EntityTable.c.question_count:row[6],\
                               EntityTable.c.question_sources:row[7], EntityTable.c.seed:row[8], EntityTable.c.active:row[9], EntityTable.c.archive:row[10], EntityTable.c.collection_id:row[11], EntityTable.c.creator_id:row[12], EntityTable.c.dataset_id:row[13]})
                elif str(EntityTable.name) == 'logger_examlog':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.closed: row[4], \
                               EntityTable.c.dataset_id:row[5], EntityTable.c.exam_id:row[6], EntityTable.c.user_id:row[7],\
                               EntityTable.c.completion_timestamp:row[8]})
                elif str(EntityTable.name) == 'logger_examattemptlog':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c._morango_dirty_bit: row[1], \
                               EntityTable.c._morango_source_id:row[2], EntityTable.c._morango_partition:row[3], EntityTable.c.item: row[4], \
                               EntityTable.c.end_timestamp:row[5], EntityTable.c.completion_timestamp:row[6], EntityTable.c.time_spent:row[7],\
                               EntityTable.c.complete:row[8], EntityTable.c.correct:row[9], EntityTable.c.hinted:row[10], EntityTable.c.answer:row[11], \
                               EntityTable.c.simple_answer:row[12], EntityTable.c.interaction_history:row[13], EntityTable.c.content_id:row[14],\
                               EntityTable.c.channel_id:row[15], EntityTable.c.dataset_id:row[16], EntityTable.c.examlog_id:row[17], EntityTable.c.user_id:row[18], EntityTable.c.start_timestamp:row[19] })
                
                elif str(EntityTable.name) == 'content_contentnode':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c.title: row[1], \
                               EntityTable.c.content_id:row[2], EntityTable.c.channel_id:row[3], EntityTable.c.description: row[4], \
                               EntityTable.c.sort_order:row[5], EntityTable.c.license_owner:row[6], EntityTable.c.author:row[7],\
                               EntityTable.c.kind:row[8], EntityTable.c.available:row[9], EntityTable.c.stemmed_metaphone:row[10], EntityTable.c.lft:row[11], \
                               EntityTable.c.rght:row[12], EntityTable.c.tree_id:row[13], EntityTable.c.level:row[14],\
                               EntityTable.c.lang_id:row[15], EntityTable.c.license_name:row[16], EntityTable.c.license_description:row[17], EntityTable.c.parent_id:row[18]})
                
                elif str(EntityTable.name) == 'content_assessmentmetadata':
                    res = self.checkRecordExist(str(row[0]), EntityTable, sinkConnection, row)
                    if res != 0:
                        # logging.info("inside else kolibriauth_collection") 
                        stmt = update(EntityTable).where(EntityTable.c.id==str(row[0])).values({EntityTable.c.assessment_item_ids: row[1], \
                               EntityTable.c.number_of_assessments:row[2], EntityTable.c.mastery_model:row[3], EntityTable.c.randomize: row[4], \
                               EntityTable.c.is_manipulable:row[5], EntityTable.c.contentnode_id:row[6]})
            
            logging.info("End database fetced name:"+ argsList['dbName'])
            end_time = datetime.datetime.now()
            logging.info("End time:"+ end_time.strftime('%D:%H:%M:%S'))

        # session.close()
        except Exception as e:
            logging.basicConfig(filename='Fetcher.log', level=logging.ERROR)
            logging.error('There is an exception in the code Fetcher!')
            logging.error(e)
            logging.error(traceback.format_exc())
            raise

    def checkRecordExist(self, rowID, EntityTable, sinkConnection, row):
        # print (row)
        select_st = select([EntityTable]).where(EntityTable.c.id == rowID)
        res = sinkConnection.execute(select_st)
        count = res.rowcount
        try:
            if count == 0:
                sinkConnection.execute(EntityTable.insert(), row)
            return count
        except Exception as e:
            pass

