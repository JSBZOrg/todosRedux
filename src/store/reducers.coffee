import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'
import todosReducers from '../models/todos/reducers'
import dd from 'ddeyes'

initialState =
  todos: []

todos = handleActions

  TODO_SAVE: todosReducers.save
  TODO_PATCH: todosReducers.patch
  TODO_RELOAD: todosReducers.reload
  TODO_REMOVE: todosReducers.remove
  TODO_REMOVE_ALL: todosReducers.removeAll
  
, initialState.todos

export {
  todos
  initialState
}

export default mergeReduce {
  todos
}
, initialState
