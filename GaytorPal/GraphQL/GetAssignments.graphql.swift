query GetAssignmentsByDue($targetUsername: String!, $targetDueDate: String!) {
  getAssignmentsByDue(target_username: $targetUsername, target_dueDate: $targetDueDate) {
    category
    description
    dueDate
    title
    completed
    id
  }
}
