#!/bin/bash

# ERD Collaboration Helper Script
# Hỗ trợ các task thường dùng khi làm việc với draw.io files

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

function show_help() {
    echo -e "${GREEN}ERD Collaboration Helper${NC}"
    echo ""
    echo "Usage: ./collaboration-helper.sh [command]"
    echo ""
    echo "Commands:"
    echo "  create-branch    Tạo branch mới cho task"
    echo "  backup          Tạo backup các file .drawio"
    echo "  restore         Restore file từ backup"
    echo "  validate        Kiểm tra file .drawio có valid không"
    echo "  list-files      Liệt kê tất cả file .drawio"
    echo "  help            Hiển thị help"
}

function create_branch() {
    echo -e "${YELLOW}Tạo branch mới...${NC}"
    read -p "Nhập tên task (vd: update-lab3-erd): " task_name
    
    if [[ -z "$task_name" ]]; then
        echo -e "${RED}Lỗi: Tên task không được để trống${NC}"
        exit 1
    fi
    
    # Get current date
    current_date=$(date +%Y%m%d)
    branch_name="feature/${task_name}-${current_date}"
    
    # Create and checkout branch
    git checkout main
    git pull origin main
    git checkout -b "$branch_name"
    
    echo -e "${GREEN}✅ Đã tạo branch: $branch_name${NC}"
    echo -e "${YELLOW}Bây giờ bạn có thể chỉnh sửa file và commit thay đổi${NC}"
}

function backup_files() {
    echo -e "${YELLOW}Tạo backup các file .drawio...${NC}"
    
    backup_dir="backups/$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    
    # Copy all .drawio files
    find . -name "*.drawio" -not -path "./backups/*" -exec cp {} "$backup_dir/" \;
    
    echo -e "${GREEN}✅ Backup hoàn thành tại: $backup_dir${NC}"
    ls -la "$backup_dir"
}

function restore_file() {
    echo -e "${YELLOW}Restore file từ backup...${NC}"
    
    if [[ ! -d "backups" ]]; then
        echo -e "${RED}Lỗi: Không tìm thấy thư mục backups${NC}"
        exit 1
    fi
    
    echo "Các backup có sẵn:"
    ls -1 backups/
    
    read -p "Chọn backup folder: " backup_folder
    read -p "Nhập tên file cần restore: " filename
    
    if [[ -f "backups/$backup_folder/$filename" ]]; then
        cp "backups/$backup_folder/$filename" .
        echo -e "${GREEN}✅ Đã restore file: $filename${NC}"
    else
        echo -e "${RED}Lỗi: File không tồn tại trong backup${NC}"
    fi
}

function validate_files() {
    echo -e "${YELLOW}Kiểm tra tính hợp lệ của files .drawio...${NC}"
    
    valid_count=0
    invalid_count=0
    
    for file in *.drawio; do
        if [[ -f "$file" ]]; then
            # Basic validation - check if file starts with XML declaration or mxfile
            if head -1 "$file" | grep -E "^<\?xml|^<mxfile" > /dev/null; then
                echo -e "${GREEN}✅ $file - Valid XML format${NC}"
                ((valid_count++))
            else
                echo -e "${RED}❌ $file - Invalid format${NC}"
                ((invalid_count++))
            fi
        fi
    done
    
    echo ""
    echo -e "${GREEN}Valid files: $valid_count${NC}"
    echo -e "${RED}Invalid files: $invalid_count${NC}"
}

function list_drawio_files() {
    echo -e "${GREEN}Danh sách các file .drawio:${NC}"
    echo ""
    
    for file in *.drawio; do
        if [[ -f "$file" ]]; then
            size=$(du -h "$file" | cut -f1)
            # Simple date format that works on most systems
            modified=$(ls -l "$file" | awk '{print $6, $7, $8}')
            echo -e "${YELLOW}📄 $file${NC} (${size}, modified: ${modified})"
        fi
    done
}

# Main script logic
case "${1:-help}" in
    create-branch)
        create_branch
        ;;
    backup)
        backup_files
        ;;
    restore)
        restore_file
        ;;
    validate)
        validate_files
        ;;
    list-files)
        list_drawio_files
        ;;
    help|*)
        show_help
        ;;
esac