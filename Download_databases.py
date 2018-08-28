import requests
import re
import wget
from dateutil import parser
import os.path, time
from collections import OrderedDict
import glob
import os,sys

username = 'nalandamande@gmail.com'
password = 'softcorner'

URL='http://kolibridataupload.learningequality.org/db_uploads/nalanda/latest/'
DOMAIN = 'http://kolibridataupload.learningequality.org'
HREF_REGEX = re.compile('(?<=href=").*?(?=")')
#DATE_REGEX = re.compile('[0-9]+\-[a-zA-z]+\-[0-9]*\ [0-9:]+')
# DATE_REGEX = re.compile('([a-zA-Z]+. \d{2}, \d{4}, \d[:][\d]+ [a-z]+.{2})')
DATE_REGEX = re.compile('([a-zA-Z]+. \d+, \d{4}, [\d+]+[:]*[\d]* [a-zA-z\.]{3})')
count = 0

def getList(url):
	response = requests.get(url, auth=(username, password), allow_redirects=True)
	textResponse = str(response.text)
	print ("Response:", textResponse)
	result = HREF_REGEX.findall(textResponse)
	objDate = DATE_REGEX.findall(textResponse)
	print ("objDate:", objDate)
	print ("Len:", len(objDate))
	objDate  = [parser.parse(i_date) for i_date in objDate]
	# print ("DBList:", result)
	# print ("DateList:", objDate)
	# sys.exit(0)
	return result, objDate

def downloadDB(dbList, dateList):
	# print ("DBLIst:", len(dbList))
	# print ("dateList:", len(dateList))
	result = OrderedDict(zip(dbList, dateList))
	# print ("Result:", result)
	global count
	# print ("Result Data:", len(result.keys()))
	for k,v in result.items():
		# objValue = parser.parse(v)
		# if objValue > objLatestDate:
		dirpath = os.path.join('/Users/Admin/Desktop/Kolibri_DB_Backup', 'kolibri_databases', str(k[27:]))
		print ("dirpath:", dirpath)
		if (os.path.isfile(dirpath)):
			continue
			# count = count + 1
			# print ("File present:", str(count))
			# os.remove(dirpath)
		working_directory = os.path.join('/Users/Admin/Desktop/Kolibri_DB_Backup', 'kolibri_databases')
		os.chdir(working_directory)
		try:
			# file_name = wget.download(URL + k)
			file_name = DOMAIN + k
			print ("Complete URL:", file_name)
			r = requests.get(file_name, allow_redirects=True, auth=(username,password))
			filename = get_filename_from_cd(r.headers.get('content-disposition'))
			open(filename, 'wb').write(r.content)
			count+=1
			# print ("Downloaded file:", filename)
			print ("Download File count", str(count))
			
		except Exception as e:
			print (e)
		#else:
			#print ("File not present:", dirpath)
	print ("server db downloading is completed")

def get_filename_from_cd(cd):
    """
    Get filename from content-disposition
    """
    if not cd:
        return None
    fname = re.findall('filename=(.+)', cd)
    if len(fname) == 0:
        return None
    return fname[0]

if __name__ == '__main__':
	#dirPath = os.path.join('/Users/Admin/Desktop/Kolibri_DB_Backup', 'kolibri_databases')
	# list_of_files = glob.glob(dirPath+'/*')
	# latest_file = max(list_of_files, key=os.path.getctime)
	#latestDate = time.ctime(os.path.getctime(latest_file))
	#print("objLatestDate:", latestDate)
	#latestDate = "Tue Jan 1 01:15:12 2018"
	#latestDate = "Tue Apr 4 19:15:10 2017"
	#objLatestDate = parser.parse(latestDate)
	dbList, dateList = getList(URL)
	# print ("Databases count:",dbList)
	if len(dbList) > 0:
		downloadDB(dbList[1:], dateList)
		



