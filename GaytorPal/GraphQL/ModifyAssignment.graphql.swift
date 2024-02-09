mutation ModifyTask($targetId: ID!, $userId: ID!, $title: String, $dueDate: String, $description: String, $category: String, $completed: Boolean) {
  modifyAssignment(target_id: $targetId, user_id: $userId, title: $title, dueDate: $dueDate, description: $description, category: $category, completed: $completed) {
    assignments {
      category
      completed
      description
      dueDate
      id
      title
    }
  }
}
