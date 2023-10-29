import tkinter as tk
from tkinter import ttk, messagebox
import requests
import os
import hashlib
import threading

# URL của API trên server
api_url = "http://localhost:8000"

# Thư mục lưu trữ các tệp cần cập nhật
destination_folder = "C:\\Program Files (x86)\\VNG\\update\\test"

# Biến trạng thái để kiểm tra xem giao diện đã hiển thị hay chưa
interface_displayed = False

# Hàm kiểm tra và cập nhật tệp
def check_and_update_files():
    global interface_displayed
    
    if interface_displayed:
        # Gọi API để lấy danh sách tệp cần cập nhật từ server
        response = requests.get(api_url + "/get_update_files")
        
        if response.status_code == 200:
            server_files = response.json()
            print(server_files)
        else:
            messagebox.showerror("Lỗi", "Không thể lấy danh sách tệp cần cập nhật từ server.")
            return
    
        total_files = len(server_files)
        current_file = 0

        progress = ttk.Progressbar(root, orient="horizontal", length=200, mode="determinate")
        progress.pack(pady=10)

        # Kiểm tra và tải tệp cập nhật
        for file, server_md5 in server_files.items():
            local_file_path = os.path.join(destination_folder, file)
            
            if not os.path.exists(local_file_path):
                r = requests.get(api_url + "/download_file/" + file, stream=True)
                if r.status_code == 200:
                    with open(local_file_path, "wb") as f:
                        for chunk in r.iter_content(8192):
                            f.write(chunk)
                else:
                    print("Lỗi trong quá trình tải xuống {file}")
            else:
                with open(local_file_path, "rb") as f:
                    local_md5 = hashlib.md5(f.read()).hexdigest()
                if local_md5 != server_md5:
                    r = requests.get(api_url + "/download_file/" + file, stream=True)
                    if r.status_code == 200:
                        with open(local_file_path, "wb") as f:
                            for chunk in r.iter_content(8192):
                                f.write(chunk)
                    else:
                        print("Lỗi trong quá trình tải xuống {file}")
                else:
                    print(f"{file} đã được cập nhật.")

            current_file += 1
            progress["value"] = (current_file / total_files) * 100
            root.update_idletasks()

        progress.destroy()  # Xóa progress bar sau khi hoàn thành

        messagebox.showinfo("Thông báo", "Cập nhật hoàn thành.")

# Hàm bắt đầu quá trình cập nhật trong một luồng riêng biệt
def start_update_thread():
    update_thread = threading.Thread(target=check_and_update_files)
    update_thread.start()

# Hàm xử lý sự kiện khi giao diện được hiển thị
def on_interface_shown():
    global interface_displayed
    if not interface_displayed:
        interface_displayed = True
        messagebox.showinfo("Thông báo", "Giao diện đã được hiển thị.")
        check_and_update_files()
    login_button.config(state="normal")  # Bỏ grey nút Đăng nhập

# Tạo cửa sổ giao diện
root = tk.Tk()
root.title("Launcher")
root.geometry("400x300")

# Tạo background từ hình ảnh
background_image = tk.PhotoImage(file="background.png")
background_label = tk.Label(root, image=background_image)
background_label.place(relwidth=1, relheight=1)

# Tạo button "Đăng nhập" và gán chức năng
login_button = tk.Button(root, text="Đăng nhập", command=start_update_thread, state="disabled")  # Ban đầu vô hiệu hóa nút
login_button.pack(pady=50)

# Tạo button "Thoát" và gán chức năng
exit_button = tk.Button(root, text="Thoát", command=root.quit)
exit_button.pack()

# Gắn sự kiện khi giao diện được hiển thị
root.bind("<Map>", lambda e: on_interface_shown())

# Mở cửa sổ giao diện
root.mainloop()
