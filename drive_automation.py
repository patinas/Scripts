import os
import shutil
import google.auth
from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError


# Define your file extensions and their corresponding folder names here
file_extensions = {
    '.pdf': 'PDFs',
    '.docx': 'Word documents',
    '.xlsx': 'Excel spreadsheets',
    '.jpg': 'JPEG images',
    '.png': 'PNG images',
}

# Authenticate with Google Drive API
creds, _ = google.auth.default(scopes=['https://www.googleapis.com/auth/drive'])
service = build('drive', 'v3', credentials=creds)

# Get all files in the root directory of Google Drive
results = service.files().list(
    q="mimeType!='application/vnd.google-apps.folder' and trashed=false and 'root' in parents",
    fields="nextPageToken, files(id, name, mimeType)").execute()
files = results.get('files', [])

# Iterate through each file and move it to the corresponding folder
for file in files:
    file_extension = os.path.splitext(file['name'])[1]
    if file_extension in file_extensions:
        folder_name = file_extensions[file_extension]
        try:
            # Check if the folder already exists, if not create it
            folder_id = service.files().list(
                q="mimeType='application/vnd.google-apps.folder' and trashed=false and name='{}' and 'root' in parents".format(folder_name),
                fields="nextPageToken, files(id, name)").execute().get('files', [])[0].get('id', None)
            if folder_id is None:
                folder_metadata = {'name': folder_name, 'parents': ['root'], 'mimeType': 'application/vnd.google-apps.folder'}
                folder = service.files().create(body=folder_metadata, fields='id').execute()
                folder_id = folder.get('id', None)

            # Move the file to the corresponding folder
            file_metadata = {'parents': [folder_id]}
            service.files().update(fileId=file['id'], body=file_metadata).execute()

            print('Moved {} to {}'.format(file['name'], folder_name))

        except HttpError as error:
            print('An error occurred: {}'.format(error))
