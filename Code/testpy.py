import argparse
import pymysql
from Transformer_plumber import Transformer_plumber

MUMBAI_SCHOOLS = []
MUMBAI_SCHOOLS_FACILITYIDS = []

PUNE_SCHOOLS = []
PUNE_SCHOOLS_FACILITYIDS = []

DELHI_SCHOOLS = []
DELHI_SCHOOLS_FACILITYIDS = []

RAJSTHAN_SCHOOLS = []
RAJSTHAN_SCHOOLS_FACILITYIDS = []

OTHER_SCHOOLS = []
OTHER_SCHOOLS_FACILITYIDS = []

CITY_INITIAL = dict([
					('M','mumbai'),
					('P','pune'),
					('D','delhi'),
					('R','rajsthan'),
					('O','other')
					])

choices = {'mumbai':(MUMBAI_SCHOOLS,MUMBAI_SCHOOLS_FACILITYIDS),
		   'pune': (PUNE_SCHOOLS, PUNE_SCHOOLS_FACILITYIDS),
		   'delhi': (DELHI_SCHOOLS,DELHI_SCHOOLS_FACILITYIDS),
		   'rajsthan':(RAJSTHAN_SCHOOLS,RAJSTHAN_SCHOOLS_FACILITYIDS),
		   'other':(OTHER_SCHOOLS, OTHER_SCHOOLS_FACILITYIDS)
		   }

parser = argparse.ArgumentParser(description='Transform kolibri data into nalanda data')

parser.add_argument('-c','--city', help='Use the city name to transform kolibri data to nalanda data')

args = parser.parse_args()


conn = pymysql.connect(host = "localhost", user = "root", passwd = "softcorner", database = "schools")
cursor = conn.cursor()

sql = "select dataset_id,name from kolibriauth_collection where parent_id is null"
cursor.execute(sql)
rows = cursor.fetchall()

for row in rows:
	if row[1][0] in CITY_INITIAL.keys():
		choices[CITY_INITIAL[row[1][0]]][0].append(row[1])
		choices[CITY_INITIAL[row[1][0]]][1].append(row[0])

	else:
		OTHER_SCHOOLS.append(row[1])
		OTHER_SCHOOLS_FACILITYIDS.append(row[0])

def parse_schools(args):
	try:
		index = None
		if args.city in choices.keys():
			dataset_id = []
			count = 0
			for school in choices[args.city][0]:
				count += 1
				print ("\t" +str(count) + ":" + school)
			ip = input("Select school index using space to transform data: ")
			if not ip:
				print ("Please select correct option")
				return 
			index = set(ip.split())

			for school_index in index:
				dataset_id.append(choices[args.city][1][int(school_index)-1])
		print ("dataset_id:", dataset_id)
		return dataset_id
	except Exception as e:
		raise(e)

def update_datsetid(dataset_id):
	with open("constants.py", "w") as constants_file:
		constants_file.write("result = "+ str(dataset_id))

if __name__ == "__main__":
	dataset_id = parse_schools(args)
	update_datsetid(dataset_id)
	transform_plumber = Transformer_plumber()
	transform_plumber.execute()
