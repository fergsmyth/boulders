import pandas as pd
import requests
from bs4 import BeautifulSoup
from tabulate import tabulate
from sqlalchemy import create_engine
engine = create_engine('postgresql://postgres:mysecretpassword@localhost:5432/postgres')

problemsUrl = 'http://www.theshortspan.com/newproblemdatabase/newproblemdatabase.php'
page = requests.get(problemsUrl)
soup = BeautifulSoup(page.content, "html5lib")
problemsTable = soup.find('table', {'width':'100%'})
df = pd.read_html(str(problemsTable))[0]
df.columns = df.iloc[0]
df = df.drop(df.index[0])
df = df.apply(lambda x: x.astype(str).str.lower())
df = df.rename(columns={'Boulder/Sector':'boulder_sector'})
df.to_sql('problems', engine, if_exists='replace')