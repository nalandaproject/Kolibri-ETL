import schedule
import configparser
import logging
from FetcherPlumber import FetcherPlumber
import traceback
import MySQLdb
import datetime
from Transformer_plumber import Transformer_plumber

def doETL():
    logging.basicConfig(filename='Fetcher.log', level=logging.INFO)
    start_time = datetime.datetime.now()
    #fetch_plumber = FetcherPlumber()
    transform_plumber = Transformer_plumber()
    #fetch_plumber.SourceToStagingJob()
    transform_plumber.execute()
    end_time = datetime.datetime.now()
    total_time = end_time-start_time
    logging.info("Complete time is : "+str((total_time.seconds)/60))

if __name__ == "__main__":
    try:
        doETL()
    except Exception as e:
        logging.basicConfig(filename='Fetcher.log', level=logging.ERROR)
        logging.error('There is an exception in the code Schedular !')
        logging.error(e)
        logging.error(traceback.format_exc())



