### Local postgres docker
docker run --rm   --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data  postgres
psql -h localhost -U postgres -d postgres

### Short span problem scrapper

You need to have python3 and pip3 installed and a local postgres docker running as explained above.  
To keep your user python environment clean, best to create a virtual one as follows:

#### Virtual Environment (Optional)
#####Create virtual environment .venv
python3 -m venv .venv

#####Launch virtual environment  
(cygwin) source .venv\Scripts\activate  
(windows) .venv\Scripts\activate.bat  
(unix) source .venv/bin/activate  

#### Run scrapper
#####One time run per virtual environment  
pip install -r requirements.txt

#####Execute script  
python bouldering-problems-ireland-scrapper.py

Any added imports should be updated in the requirements.txt.   
Avoid using pip freeze > requirements.txt as it dirties the file with transitive dependencies. 
Version info available at https://pypi.org/search/

