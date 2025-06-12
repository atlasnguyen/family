-- User table: Bố mẹ, Con đều là user
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  email VARCHAR(100) UNIQUE,
  type VARCHAR(10) NOT NULL, -- 'parent' | 'child'
  created_at TIMESTAMP DEFAULT NOW()
);

-- Profile của con, liên kết với parent
CREATE TABLE child_profiles (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) UNIQUE,
  parent_id INTEGER REFERENCES users(id),
  fullname VARCHAR(100),
  birthday DATE,
  gender VARCHAR(10),
  avatar VARCHAR(255),
  created_at TIMESTAMP DEFAULT NOW()
);

-- Nhiệm vụ do bố mẹ tạo ra
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  parent_id INTEGER REFERENCES users(id),
  title VARCHAR(255) NOT NULL,
  description TEXT,
  deadline TIMESTAMP,
  reward_point INTEGER DEFAULT 0,
  penalty_point INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Nhiệm vụ mà con nhận, trạng thái, nội dung hoàn thành
CREATE TABLE child_tasks (
  id SERIAL PRIMARY KEY,
  child_id INTEGER REFERENCES users(id),
  task_id INTEGER REFERENCES tasks(id),
  status VARCHAR(20) DEFAULT 'pending', -- pending, waiting_approval, approved, rejected
  completed_at TIMESTAMP,
  comment TEXT,
  lesson_content TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Thư viện quà tặng
CREATE TABLE gifts (
  id SERIAL PRIMARY KEY,
  parent_id INTEGER REFERENCES users(id),
  name VARCHAR(100),
  icon VARCHAR(255),
  point INTEGER,
  gift_group VARCHAR(100),
  description TEXT,
  quantity INTEGER,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Lịch sử đổi quà của con
CREATE TABLE gift_exchanges (
  id SERIAL PRIMARY KEY,
  child_id INTEGER REFERENCES users(id),
  gift_id INTEGER REFERENCES gifts(id),
  status VARCHAR(20) DEFAULT 'waiting', -- waiting, approved, delivered, rejected
  requested_at TIMESTAMP DEFAULT NOW(),
  approved_at TIMESTAMP
);

-- Huy hiệu
CREATE TABLE badges (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  icon VARCHAR(255),
  description TEXT
);

-- Huy hiệu con nhận được
CREATE TABLE child_badges (
  id SERIAL PRIMARY KEY,
  child_id INTEGER REFERENCES users(id),
  badge_id INTEGER REFERENCES badges(id),
  awarded_by INTEGER REFERENCES users(id),
  awarded_at TIMESTAMP DEFAULT NOW(),
  note TEXT
);

-- Trò chơi giáo dục
CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  icon VARCHAR(255),
  point_per_play INTEGER,
  play_time INTEGER, -- seconds
  description TEXT
);

CREATE TABLE game_play_histories (
  id SERIAL PRIMARY KEY,
  child_id INTEGER REFERENCES users(id),
  game_id INTEGER REFERENCES games(id),
  score INTEGER,
  played_at TIMESTAMP DEFAULT NOW()
);

-- Lịch sử điểm thưởng/phạt/đổi quà
CREATE TABLE point_histories (
  id SERIAL PRIMARY KEY,
  child_id INTEGER REFERENCES users(id),
  type VARCHAR(20), -- reward, penalty, exchange
  point INTEGER,
  description TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Hồ sơ gia đình
CREATE TABLE family_profiles (
  id SERIAL PRIMARY KEY,
  parent_id INTEGER REFERENCES users(id),
  description TEXT,
  motto TEXT,
  theme VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW()
);

-- Châm ngôn mỗi ngày
CREATE TABLE daily_mottos (
  id SERIAL PRIMARY KEY,
  content TEXT
);

-- Thông báo
CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  type VARCHAR(20),
  content TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  read BOOLEAN DEFAULT FALSE
);

-- Lập kế hoạch tuần
CREATE TABLE weekly_plans (
  id SERIAL PRIMARY KEY,
  child_id INTEGER REFERENCES users(id),
  week VARCHAR(20), -- e.g. '2025-W24'
  daily_tasks JSONB,
  created_at TIMESTAMP DEFAULT NOW()
);