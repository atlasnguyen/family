CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  email VARCHAR(100) UNIQUE,
  type VARCHAR(10) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

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

CREATE TABLE child_tasks (
  id SERIAL PRIMARY KEY,
  child_id INTEGER REFERENCES users(id),
  task_id INTEGER REFERENCES tasks(id),
  status VARCHAR(20) DEFAULT 'pending',
  completed_at TIMESTAMP,
  comment TEXT,
  lesson_content TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);