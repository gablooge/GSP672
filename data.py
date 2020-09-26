import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Use the application default credentials
# cred = credentials.ApplicationDefault()
cred = credentials.Certificate("key.json")
firebase_admin.initialize_app(cred, {
  'projectId': 'PROJECT_ID',
})

db = firestore.client()


doc_ref = db.collection(u'recommendations').document(u'foo')
doc_ref.set({
    u'productIds': [
    	u'LS4PSXUNUM', u'L9ECAV7KIM', u'6E92ZMYYFZ', u'OLJCESPC7Z', u'66VCHSJNUP',
    ]
})
