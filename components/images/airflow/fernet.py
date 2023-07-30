# execution: py fernet.py
# used to get value for AIRFLOW__CORE__FERNET_KEY
from cryptography.fernet import Fernet
fernet_key= Fernet.generate_key()
print(fernet_key.decode())