mutation AddAssignment($username: String!, $title: String!, $description: String!, $dueDate: String!, $category: String!) {
  addAssignment(username: $username, title: $title, description: $description, dueDate: $dueDate, category: $category) {
    email
  }
}
