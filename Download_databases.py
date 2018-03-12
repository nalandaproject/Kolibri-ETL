import requests
import re
import wget
from dateutil import parser
import os.path, time
from collections import OrderedDict
import glob
import os
from local_settings import *

HREF_REGEX = re.compile('(?<=href=").*?(?=")')
DATE_REGEX = re.compile('[0-9]+\-[a-zA-z]+\-[0-9]*\ [0-9:]+')

def getList(url):
	response = requests.get(url, allow_redirects=True)
	textResponse = str(response.text)
	result = HREF_REGEX.findall(textResponse)
	objDate = DATE_REGEX.findall(textResponse)
	return result, objDate

def downloadDB(dbList, dateList, objLatestDate):
	result = OrderedDict(zip(dbList, dateList))
	count = 0
	for k,v in result.items():
		objValue = parser.parse(v)
		if objValue > objLatestDate:
			dirpath = os.path.join('/Users/Admin/Documents/projects/CMU_Nalanda/Kolibri-ETL', 'kolibri_databases', str(k))
			if (os.path.isfile(dirpath)):
				count = count + 1
				print ("File present:", str(count))
				os.remove(dirpath)
			working_directory = os.path.join('/Users/Admin/Documents/projects/CMU_Nalanda/Kolibri-ETL', 'kolibri_databases')
			os.chdir(working_directory)
			try:
				file_name = wget.download(URL + k)
				print ("Downloaded file:", file_name)
			except Exception as e:
				print (e)
			#else:
				#print ("File not present:", dirpath)
	print ("server db downloading is completed")

if __name__ == '__main__':
	dirPath = os.path.join('/Users/Admin/Documents/projects/CMU_Nalanda/Kolibri-ETL', 'kolibri_databases')
	list_of_files = glob.glob(dirPath+'/*')
	latest_file = max(list_of_files, key=os.path.getctime)
	latestDate = time.ctime(os.path.getctime(latest_file))
	#latestDate = "Tue Jan 1 01:15:12 2018"
	#latestDate = "Tue Apr 4 19:15:10 2017"
	objLatestDate = parser.parse(latestDate)
	dbList, dateList = getList(URL)
	print ("Databases count:",str(len(dbList)))
	if len(dbList) > 0:
		downloadDB(dbList[1:], dateList, objLatestDate)
		



