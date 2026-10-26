export default defineEventHandler(async (_event) => {
  try {
    const users = [{
      id: '1',
      name: 'Jon Doe',
      email: 'jondoe@emai.coim',
    }]
    return { users }
  }
  catch (error) {
    console.error('Failed to query users:', error)
    return { error: 'Could not query users yet.', users: [] }
  }
})
