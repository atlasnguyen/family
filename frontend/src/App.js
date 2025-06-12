import React, { useEffect, useState } from "react";

function App() {
  const [tasks, setTasks] = useState([]);
  useEffect(() => {
    fetch(process.env.REACT_APP_API_URL + "/tasks/parent/1")
      .then(res => res.json())
      .then(data => setTasks(data));
  }, []);
  return (
    <div>
      <h1>Gia Đình Kết Nối - Demo Frontend</h1>
      <ul>
        {tasks.map(task => (
          <li key={task.id}>
            {task.title} - Điểm thưởng: {task.reward_point}
          </li>
        ))}
      </ul>
    </div>
  );
}
export default App;