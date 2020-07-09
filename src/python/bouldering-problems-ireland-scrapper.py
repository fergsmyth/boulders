import pandas as pd
import requests
from bs4 import BeautifulSoup
from tabulate import tabulate
from sqlalchemy import create_engine

def main():

    # Request problems page
    problemsUrl = 'http://www.theshortspan.com/newproblemdatabase/newproblemdatabase.php'
    page = requests.get(problemsUrl)
    
    # Use html5lib (browser style) for less strict parsing - fixes all unclosed td tags
    soup = BeautifulSoup(page.content, "html5lib")
    
    # Find inner table that contains each problem as a row
    problemsTable = soup.find('table', {'width':'100%'})

    # Read html of tbody -- a dataframe of tr tags values 
    df = pd.read_html(str(problemsTable))[0]

    # Lower case all data
    df = df.apply(lambda x: x.astype(str).str.lower())

    # Set first data row as column headers     
    df.columns = df.iloc[0]
    
    # Drop first row data
    df = df.drop(df.index[0])

    # Replace header naming conventions
    df = df.rename(columns={'boulder/sector':'boulder_sector'})
    df = df.rename(columns={'first ascentist':'sender'})
    df = df.rename(columns={'fa date':'sent_date'})    

    # Insert each problem into db
    engine = create_engine('postgresql://postgres:mysecretpassword@localhost:5432/postgres')
    df.to_sql('short_span_problems', engine, if_exists='replace')

if __name__ == "__main__":
    # execute only if run as a script
    main()