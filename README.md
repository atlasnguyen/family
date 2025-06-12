# Gia Đình Kết Nối - Fullstack Source

## 1. Database
- Cài PostgreSQL, tạo database `happydb`
- Chạy script `db/init.sql` để tạo bảng

## 2. Backend (NestJS)
```bash
cd backend
npm install
npm run build
npm run start:dev
```
- Sửa file `.env` nếu cần
- API chạy ở http://localhost:3000

## 3. Frontend (ReactJS)
```bash
cd frontend
npm install
npm start
```
- Sửa file `.env` để trỏ về API backend nếu cần
- Website chạy ở http://localhost:3000 hoặc http://localhost:3001

## 4. Kết nối
- Frontend tự động gọi API backend
- Đăng ký tài khoản, thêm nhiệm vụ, kiểm thử chức năng

## 5. Ghi chú mở rộng
- Có thể bổ sung module, bảng, UI theo nhu cầu thực tế
- Có thể viết thêm Dockerfile, docker-compose để deploy dễ dàng hơn