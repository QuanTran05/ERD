# ERD - Entity Relationship Diagrams

Kho lưu trữ các sơ đồ ERD và Use Case cho dự án. Repository này chứa các file draw.io có thể chỉnh sửa cộng tác.

## Cách chỉnh sửa draw.io cùng nhau (Collaborative Editing)

### Phương pháp 1: Sử dụng draw.io trực tuyến (Khuyến nghị)

1. **Mở file từ GitHub:**
   - Truy cập file .drawio trên GitHub
   - Click "Raw" để lấy URL của file
   - Vào [app.diagrams.net](https://app.diagrams.net)
   - Chọn "Device" → "Import from URL" 
   - Dán URL và mở file

2. **Chỉnh sửa và lưu:**
   - Chỉnh sửa sơ đồ theo ý muốn
   - File → Export as → XML (.drawio)
   - Lưu file với tên gốc

3. **Cập nhật lên GitHub:**
   - Upload file đã chỉnh sửa lên repository
   - Tạo commit message mô tả thay đổi
   - Tạo Pull Request để review

### Phương pháp 2: Real-time Collaboration với Google Drive

1. **Upload lên Google Drive:**
   - Upload file .drawio lên Google Drive
   - Share với team members (Editor access)

2. **Mở bằng draw.io:**
   - Chuột phải file → Open with → diagrams.net
   - Nhiều người có thể chỉnh sửa cùng lúc

3. **Sync về GitHub:**
   - Download file về máy định kỳ
   - Commit thay đổi lên repository

### Phương pháp 3: Sử dụng Git Workflow

1. **Clone repository:**
   ```bash
   git clone https://github.com/QuanTran05/ERD.git
   cd ERD
   ```

2. **Tạo branch mới:**
   ```bash
   git checkout -b feature/update-erd-[tên-file]
   ```

3. **Chỉnh sửa file:**
   - Mở file .drawio bằng draw.io
   - Thực hiện thay đổi và lưu

4. **Commit và push:**
   ```bash
   git add .
   git commit -m "Update [tên-file]: [mô tả thay đổi]"
   git push origin feature/update-erd-[tên-file]
   ```

5. **Tạo Pull Request:**
   - Tạo PR để team review
   - Merge sau khi được approve

## Các file trong repository

| File | Mô tả | Chủ đề |
|------|-------|---------|
| `Lab3.drawio` | Sơ đồ ERD cho Lab 3 | Database Design |
| `Lab3 Test.drawio` | Phiên bản test của Lab 3 | Database Design |
| `PhysicalERD topic 5.drawio` | Physical ERD cho chủ đề 5 | Database Implementation |
| `Usecase topic 5.drawio` | Use Case diagram cho chủ đề 5 | System Analysis |
| `fap.fpt.edu.vn.drawio` | ERD cho hệ thống FPT | System Design |
| `Biểu đồ không có tiêu đề.drawio` | Sơ đồ chưa đặt tên | General |

## Quy tắc khi chỉnh sửa

1. **Tạo backup trước khi chỉnh sửa lớn**
2. **Sử dụng commit message rõ ràng**
3. **Review changes trước khi merge**
4. **Không chỉnh sửa trực tiếp trên main branch**
5. **Thêm comment cho các thay đổi quan trọng**

## Công cụ cần thiết

- [draw.io (app.diagrams.net)](https://app.diagrams.net) - Web-based editor
- [draw.io Desktop](https://github.com/jgraph/drawio-desktop) - Desktop application
- Git client cho version control
- Text editor với Git integration (VS Code, IntelliJ, etc.)

## Liên hệ

Nếu cần hỗ trợ về collaborative editing, vui lòng tạo issue hoặc liên hệ team lead.