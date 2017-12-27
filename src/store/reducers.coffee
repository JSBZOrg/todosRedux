import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'
import todosReducers from '../models/todos/reducers'
import dd from 'ddeyes'

initialState =
  list_todos: []

todos = handleActions

  TODOS_SAVE: todosReducers.save
  TODOS_CREATE_ONE: todosReducers.create
  TODOS_FETCH_ONE: todosReducers.fetchOne
  TODOS_PATCH: todosReducers.patch
  TODOS_REMOVE_ONE: todosReducers.removeOne
  TODOS_REMOVE: todosReducers.remove
  

, initialState.list_todos

export {
  todos
  initialState
}

export default mergeReduce {
  todos
}
, initialState