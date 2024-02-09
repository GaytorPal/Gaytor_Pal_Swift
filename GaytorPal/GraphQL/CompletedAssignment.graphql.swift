mutation ToggleAssignment($targetId: ID!, $userId: ID!) {
  toggleCompleted(target_id: $targetId, user_id: $userId) {
    username
  }
}
