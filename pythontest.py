import os
import sys

sys.setrecursionlimit(500000)

# files = os.listdir('//PESERVER/Groupdata/website/billing/FILES/F')
files = [ 'FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462','FAIRHILL CENTER FOR AGING_0102_2014_0853','FAIRHILL CENTER FOR AGING_0611_2013_0497','BOB_FISCHER_2010-072220100802_0547','Facility_Products_&_Services_2017-120120171201_13291462', ]

stop = 0
file_num = 0
part = 0
ref = 0

name_list = ''
name = ''

dates = [ [ '1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31' ],[ 'January','February','March','April','May','June','July','August','September','October','November','December' ] ]
date = ''

day = '' 
month = ''
year = ''

job = '\t<li><a href="' + files[ file_num ] + '">\n\t\t' + date + '\n\t</a></li>'
        
def name(file_char):
    global name_list, name
    if files[ file_num ][ file_char ].isnumeric:
        name = ''.join(name_list)
    else:
        if file_char == 0:
            name_list.append(files[ file_num ][ file_char ].upper)
        else:
            if files[ file_num ][ file_char ] == '_':
                name_list.append(' ')
                file_char += 1
                name_list.append(files[ file_num ][ file_char ].upper)
            else:
                name_list.append(files[ file_num ][ file_char ].lower)
            file_char += 1
        name(file_char)  

def date(file_char):
    global day, month, year, date, ref
    if files[ file_num ][ file_char ].isnumeric:
        if ref < 6:
            if int(files[ file_num ][ file_char ] + files[ file_num ][ file_char + 1 ]) >= 1 and int(files[ file_num ][ file_char ] + files[ file_num ][ file_char + 1 ]) <= 12:
                month = dates[ 1 ][ int(files[ file_num ][ file_char ] + files[ file_num ][ file_char + 1 ]) ]
                file_char += 2
                ref += 2
                day = dates[ 0 ][ int(files[ file_num ][ file_char ] + files[ file_num ][ file_char + 1 ]) ]
            elif files[ file_num ][ file_char ] + files[ file_num ][ file_char + 1 ] == '20':
                year = files[ file_num ][ file_char ] + files[ file_num ][ file_char + 1 ] + files[ file_num ][ file_char + 2 ] + files[ file_num ][ file_char + 3 ]
                file_char += 4
                ref += 4
                date(file_char)
        else:
            date = month + day + ', ' + year
            ref = 0
    else:
        file_char += 1
        date(file_char)

def file_character(file_char):
    global file_num, stop, job
    if files[ file_num ][ file_char ].lower() == files[ file_num + 1 ][ file_char ].lower():
        if files[ file_num ][ file_char ].isnumeric():
            print(job)
            file_num += 1
            file_char = 0
        else:
            file_char += 1
        file_character()
    else:
        print(job)
        file_num += 1
        file_char = 0
        start()

def start():
    global name
    if len(files) >= file_num + 2:
        name(part)
        print('<h3>' + name + '</h3>\n<ul>')
        name = ''
        date(part)
        file_character(part)
        
start()

close = input('end')