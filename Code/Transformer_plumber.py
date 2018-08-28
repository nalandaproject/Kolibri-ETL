import transformer
import configparser
from sqlalchemy import create_engine
import datetime
import logging

class Transformer_plumber(object):
    def execute(self):
        config = configparser.ConfigParser()
        config.read('Config')
        stagingpath = config.get('ConnectionString', 'stagingDbTransformer')
        nalandapath = config.get('ConnectionString', 'nalandaDbTransformer')

        # establish sink connection
        sinkDbEngine = create_engine(nalandapath)
        sinkConnection = sinkDbEngine.connect()
        date = sinkConnection.execute('select max(latest_date) from account_latestfetchdate').fetchall()[0]

        if(date==None or date[0] == None):
            start_date = datetime.date(datetime.MINYEAR, 1, 1)
        else:
            date[0].strftime('%YYYY-%MM-%DD')
            start_date = date[0]
            
        logging.basicConfig(filename='Fetcher.log', level=logging.INFO)
        logging.info('Transformation started !')

        transformerObj = transformer.Transformer(stagingpath, nalandapath)
        transformerObj.sync_student_info();
        transformerObj.sync_class_info();
        transformerObj.sync_school_info();
        transformerObj.sync_content();

        transformerObj.completed_questions_aggregation_student(start_date)
        transformerObj.exercise_mastered_by_student(start_date)
        transformerObj.exercise_attempts_by_students(start_date)
        transformerObj.correct_questions_aggregation_student(start_date)
        transformerObj.attempted_questions_aggregation_student(start_date)
        transformerObj.mastery_level_aggregation_class(start_date)
        transformerObj.mastery_level_aggregation_school(start_date)

        transformerObj.lesson_result(start_date)

        transformerObj.user_session_student(start_date)
        transformerObj.user_session_aggregation_class(start_date)
        transformerObj.user_session_aggregation_school(start_date)
        
        transformerObj.clear_resource()

        # sinkConnection.execute('insert into account_latestfetchdate(latest_date) values(NOW())')
        
        logging.basicConfig(filename='Fetcher.log', level=logging.INFO)
        logging.info('Transformation completed !')

