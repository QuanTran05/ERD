# Hướng dẫn Chỉnh sửa Cộng tác Draw.io

## Workflow cho Team Collaboration

### Bước 1: Chuẩn bị môi trường
```bash
# Clone repository
git clone https://github.com/QuanTran05/ERD.git
cd ERD

# Cài đặt pre-commit hooks (optional)
git config core.autocrlf false  # Để tránh conflicts với line endings
```

### Bước 2: Tạo branch cho task
```bash
# Tạo branch mới từ main
git checkout main
git pull origin main
git checkout -b feature/[tên-task]-[ngày]

# Ví dụ:
git checkout -b feature/update-lab3-erd-20241217
```

### Bước 3: Chỉnh sửa file draw.io

#### Cách 1: Sử dụng draw.io online
1. Mở [app.diagrams.net](https://app.diagrams.net)
2. File → Open from → Device (chọn file .drawio)
3. Chỉnh sửa sơ đồ
4. File → Export as → XML (.drawio) 
5. Lưu với tên file gốc

#### Cách 2: Sử dụng draw.io desktop
1. Download [draw.io desktop](https://github.com/jgraph/drawio-desktop)
2. Mở file .drawio
3. Chỉnh sửa và Save (Ctrl+S)

### Bước 4: Commit thay đổi
```bash
# Kiểm tra thay đổi
git status
git diff

# Add và commit
git add [tên-file].drawio
git commit -m "feat: update [tên-file] - [mô tả ngắn]

- Added new entities: [danh sách]
- Modified relationships: [danh sách]  
- Fixed diagram layout issues"
```

### Bước 5: Push và tạo Pull Request
```bash
# Push branch
git push origin feature/[tên-branch]

# Tạo Pull Request trên GitHub
# - Thêm reviewers
# - Mô tả chi tiết thay đổi
# - Attach screenshots nếu cần
```

## Giải quyết Conflicts

### Khi có conflicts với file .drawio:
```bash
# Pull latest changes
git pull origin main

# Nếu có conflict, mở file bằng draw.io
# So sánh thay đổi và merge manual
# Hoặc sử dụng git merge tool
git mergetool
```

### Backup và Recovery:
```bash
# Tạo backup trước khi merge
cp [file].drawio [file].drawio.backup

# Restore từ backup nếu cần
cp [file].drawio.backup [file].drawio
```

## Best Practices

### 1. Naming Convention
- `EntityName-v[version].drawio` cho ERD
- `UseCase-[Module]-v[version].drawio` cho Use Cases
- `Process-[Name]-[Date].drawio` cho Process diagrams

### 2. Commit Messages
```
feat: add new entity Customer to ERD
fix: correct relationship between User and Order  
refactor: reorganize ERD layout for better readability
docs: add comments to complex relationships
```

### 3. Review Checklist
- [ ] Entities có đúng attributes không?
- [ ] Relationships có đúng cardinality không?
- [ ] Layout có dễ đọc không?
- [ ] Có conflicts với existing design không?
- [ ] Comments và documentation đã đầy đủ chưa?

### 4. File Organization
```
/
├── README.md
├── COLLABORATION.md
├── ERD/
│   ├── Lab3.drawio
│   ├── Lab3-Test.drawio
│   └── Physical-ERD-Topic5.drawio
├── UseCases/
│   └── UseCase-Topic5.drawio
└── Systems/
    └── fap.fpt.edu.vn.drawio
```

## Troubleshooting

### Lỗi thường gặp:

1. **File không mở được:**
   - Kiểm tra file có bị corrupt không
   - Restore từ git history: `git checkout HEAD~1 -- [file].drawio`

2. **Conflicts khi merge:**
   - Sử dụng external merge tool
   - Hoặc chọn 1 version và apply changes manual

3. **Performance issues:**
   - File quá lớn → tách thành nhiều file nhỏ
   - Sử dụng draw.io desktop thay vì web

4. **Version control issues:**
   - Set git attributes cho .drawio files
   - Sử dụng LFS cho files lớn (>10MB)

## Liên hệ Support

- GitHub Issues: Tạo issue với label "collaboration"
- Team Lead: [contact info]
- Documentation: [link to wiki]