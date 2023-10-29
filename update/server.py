from fastapi import FastAPI
import os
from fastapi.responses import FileResponse
import hashlib
import json

app = FastAPI()

# Thư mục chứa tệp cần cập nhật
update_folder = "C:\\Program Files (x86)\\VNG\\update\\"

# Tạo danh sách tệp và tính toán MD5 cho từng tệp
update_files = {}
for root, dirs, files in os.walk(update_folder):
    for file in files:
        file_path = os.path.join(root, file)
        with open(file_path, "rb") as f:
            md5 = hashlib.md5(f.read()).hexdigest()
        update_files[file] = md5

# Define an API route to return the list of files and their MD5 values
@app.get("/get_update_files")
def get_update_files():
    return update_files

# Define an API route to allow clients to download specific files
@app.get("/download_file/{file_name}")
async def download_file(file_name: str):
    file_path = os.path.join(update_folder, file_name)
    return FileResponse(file_path)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)